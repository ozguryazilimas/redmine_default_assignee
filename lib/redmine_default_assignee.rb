require 'redmine_default_assignee/hooks/views_issues_hook'

module RedmineDefaultAssignee

  SELECTED_USER_AUTHOR_ID = -2

  def self.settings
    Setting[:plugin_redmine_default_assignee]
  end

end

