require 'redmine_default_assignee'

Redmine::Plugin.register :redmine_default_assignee do
  name 'Redmine Default Assignee plugin'
  author 'Onur Kucuk'
  description 'Redmine plugin to define default assignees and assign them automatically on issue form'
  version '0.1.0'
  url 'http://www.ozguryazilim.com.tr'
  author_url 'http://www.ozguryazilim.com.tr'
  requires_redmine :version_or_higher => '3.0.3'


  project_module :default_assignee do
    permission :rda_default_assignee, {:projects => [:rda_project_settings]}, :require => :member
  end


  settings :partial => 'redmine_default_assignee/settings',
    :default => {
      :default_assignee => {}
    }
end

Rails.configuration.to_prepare do
  [
    [SettingsController, RedmineDefaultAssignee::Patches::SettingsControllerPatch],
    [ProjectsController, RedmineDefaultAssignee::Patches::ProjectsControllerPatch],
    [ProjectsHelper, RedmineDefaultAssignee::Patches::ProjectsHelperPatch],
  ].each do |classname, modulename|
    unless classname.included_modules.include?(modulename)
      classname.send(:include, modulename)
    end
  end

end

