
class RdaProjectSetting < ActiveRecord::Base
  unloadable

  serialize :default_assignee

  before_save :sanitize_default_assignee

  scope :for_project, ->(project) {
    proj_id = project.is_a?(Class) ? project.id : project
    where(:project_id => proj_id)
  }

  scope :settings_for_project, ->(proj_id) {
    for_project(proj_id).first_or_initialize(RedmineDefaultAssignee.settings)
  }


  def sanitize_project_settings
    default_assignee.reject!{|k, v| v.blank?}
  end

end

