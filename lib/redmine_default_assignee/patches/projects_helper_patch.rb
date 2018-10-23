require_dependency 'projects_helper'


module RedmineDefaultAssignee
  module Patches
    module ProjectsHelperPatch
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          alias_method_chain :project_settings_tabs, :redmine_default_assignee
        end
      end

      module ClassMethods

      end

      module InstanceMethods

        def project_settings_tabs_with_redmine_default_assignee
          tabs = project_settings_tabs_without_redmine_default_assignee

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
end

