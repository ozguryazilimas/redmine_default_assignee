
class RdaProjectSetting < ActiveRecord::Base
  unloadable

  attr_accessible :project_id, :default_assignee

  serialize :default_assignee

  scope :for_project, ->(project) {
    proj_id = project.is_a?(Class) ? project.id : project
    where(:project_id => proj_id)
  }

  scope :settings_for_project, ->(proj_id) {
    for_project(proj_id).first_or_initialize(RedmineDefaultAssignee.settings)
  }

end

