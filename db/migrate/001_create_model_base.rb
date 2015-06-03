class CreateModelBase < ActiveRecord::Migration

  def change
    create_table :rda_project_settings do |t|
      t.integer :project_id
      t.string :default_assignee, :default => {}.to_yaml

      t.timestamps :null => false
    end
  end

end

