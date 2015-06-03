module RedmineDefaultAssignee
  module Hooks
    class ViewsIssuesHook < Redmine::Hook::ViewListener
      render_on :view_issues_form_details_bottom, :partial => 'issues/form_rda'
    end
  end
end

