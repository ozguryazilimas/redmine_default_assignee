require_dependency 'projects_controller'


module RedmineDefaultAssignee
  module Patches
    module ProjectsControllerPatch
      def self.included(base)
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods

        def rda_project_settings
          if params[:reset].present?
            RdaProjectSetting.for_project(@project).destroy_all
            flash[:notice] = l(:notice_successful_update)
          else
            @settings = params.require(:settings).permit!
            @settings[:default_assignee] ||= {}
            @settings[:default_assignee].reject!{|_, v| v.blank?}

            project_setting = RdaProjectSetting.for_project(@project).first_or_initialize
            sanitized_settings = HashWithIndifferentAccess.new(@settings.to_h)
            project_setting.assign_attributes(sanitized_settings)

            if project_setting.save
              flash[:notice] = l(:notice_successful_update)
            else
              flash[:error] = l('redmine_default_assignee.project_settings.error_update_not_successful')
            end
          end

          redirect_to settings_project_path(@project, :tab => 'rda_project_settings')
        end

      end

    end
  end
end

