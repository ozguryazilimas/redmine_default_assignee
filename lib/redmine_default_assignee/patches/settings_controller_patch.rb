require_dependency 'settings_controller'


module RedmineDefaultAssignee
  module Patches
    module SettingsControllerPatch
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          alias_method_chain :plugin, :redmine_default_assignee
        end
      end

      module InstanceMethods

        def plugin_with_redmine_default_assignee
          if params[:id] == 'redmine_default_assignee' && params[:settings].present?
            params[:settings]['default_assignee'].reject!{|k, v| v.blank?}
          end

          plugin_without_redmine_default_assignee
        end

      end

    end
  end
end

