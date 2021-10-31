require_dependency 'issues_controller'

module RedmineDefaultAssignee
  module Patches
    module IssuesControllerPatch

      def bulk_update
        rda_changing_status_id = params[:issue]['status_id']

        if rda_changing_status_id.present?
          rda_current_project_id = Rails.application.routes.recognize_path(params[:back_url])[:project_id]
          rda_current_project = Project.find_by_identifier(rda_current_project_id)
          rda_settings = RdaProjectSetting.settings_for_project(rda_current_project)
          rda_new_assigned_to_id = rda_settings.default_assignee[rda_changing_status_id]

          if rda_settings.apply_on_context_menu && rda_new_assigned_to_id.present?
            Rails.logger.info "[DefaultAssignee] changing assigned_to_id to #{rda_new_assigned_to_id.inspect}" \
              "as it is set for status_id #{rda_changing_status_id.inspect} in settings"
            params[:issue]['assigned_to_id'] = rda_new_assigned_to_id
          end
        end

        super
      end

    end
  end
end

IssuesController.prepend(RedmineDefaultAssignee::Patches::IssuesControllerPatch)

