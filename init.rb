require 'redmine'
require_dependency File.join(File.dirname(__FILE__), 'lib/redmine_default_assignee')

Redmine::Plugin.register :redmine_default_assignee do
  name 'Redmine Default Assignee plugin'
  author 'Onur Kucuk'
  description 'Redmine plugin to define default assignees and assign them automatically on issue form'
  version '1.3.1'
  url 'http://www.ozguryazilim.com.tr'
  author_url 'http://www.ozguryazilim.com.tr'
  requires_redmine :version_or_higher => '4.0.0'


  project_module :default_assignee do
    permission :rda_default_assignee, {:projects => [:rda_project_settings]}, :require => :member
  end


  settings :partial => 'redmine_default_assignee/settings',
    :default => {
      :default_assignee => {},
      :apply_on_context_menu => false
    }
end

RedmineApp::Application.config.after_initialize do
  [
    [IssuesController, RedmineDefaultAssignee::Patches::IssuesControllerPatch],
    [SettingsController, RedmineDefaultAssignee::Patches::SettingsControllerPatch],
    [ProjectsController, RedmineDefaultAssignee::Patches::ProjectsControllerPatch],
    [ProjectsHelper, RedmineDefaultAssignee::Patches::ProjectsHelperPatch]
  ].each do |classname, modulename|
    unless classname.included_modules.include?(modulename)
      classname.send(:include, modulename)
    end
  end

end

