require 'redmine_default_assignee/hooks/views_issues_hook'

module RedmineDefaultAssignee

  SELECTED_USER_AUTHOR_ID = -2
  SELECTED_USER_CURRENT_USER_ID = -3

  def self.settings
    Setting[:plugin_redmine_default_assignee]
  end

end

