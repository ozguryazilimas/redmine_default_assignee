require 'redmine_default_assignee/hooks/views_issues_hook'

module RedmineDefaultAssignee

  def self.settings
    Setting[:plugin_redmine_default_assignee]
  end

end

