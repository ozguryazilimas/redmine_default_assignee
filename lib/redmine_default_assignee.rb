module RedmineDefaultAssignee

  SELECTED_USER_AUTHOR_ID = -2
  SELECTED_USER_CURRENT_USER_ID = -3

  def self.settings
    Setting[:plugin_redmine_default_assignee]
  end

end

# Force-load the hook class so it registers with Redmine::Hook even though
# nothing else references it by constant name. Referencing it (instead of
# require/require_dependency) lets Zeitwerk autoload/reload it safely.
RedmineDefaultAssignee::Hooks::ViewsIssuesHook

