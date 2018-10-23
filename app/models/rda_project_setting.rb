
class RdaProjectSetting < ActiveRecord::Base

  attr_accessible :project_id, :default_assignee

  serialize :default_assignee

  scope :for_project, ->(project) {
    proj_id = project.is_a?(Class) ? project.id : project
    where(:project_id => proj_id)
  }

  scope :settings_for_project, ->(proj_id) {
    for_project(proj_id).first_or_initialize(RedmineDefaultAssignee.settings)
  }


  # includes all users and groups for all application
  def self.all_assignable_users_and_groups
    types = ['User']
    types << 'Group' if Setting.issue_group_assignment?

    Principal.active.joins(:members => :roles).where(:type => types, :roles => {:assignable => true}).distinct.sorted
  end

end

