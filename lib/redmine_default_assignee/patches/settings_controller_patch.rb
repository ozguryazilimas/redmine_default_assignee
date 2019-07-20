require_dependency 'settings_controller'


module RedmineDefaultAssignee
  module Patches
    module SettingsControllerPatch

      def plugin
        original_plugin_action = super

        if params[:id] == 'redmine_default_assignee' && params[:settings].present?
          params[:settings]['default_assignee'].reject!{|k, v| v.blank?}
        end

        original_plugin_action
      end

    end
  end
end

SettingsController.prepend(RedmineDefaultAssignee::Patches::SettingsControllerPatch)

