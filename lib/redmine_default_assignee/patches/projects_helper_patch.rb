require_dependency 'projects_helper'

module RedmineDefaultAssignee
  module Patches
    module ProjectsHelperPatch

      def project_settings_tabs
        tabs = super

        if User.current.allowed_to?(:rda_default_assignee, @project)
          tabs << {
            :name => 'rda_project_settings',
            :action => :rda_manage_project_settings,
            :partial => 'projects/rda_project_settings',
            :label => 'redmine_default_assignee.project_settings.label_default_assignee'
          }
        end

        tabs
      end

    end
  end
end

ProjectsController.helper(RedmineDefaultAssignee::Patches::ProjectsHelperPatch)

