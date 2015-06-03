class CreateModelBase < ActiveRecord::Migration

  def change
    create_table :rda_project_settings do |t|
      t.string :default_assignee, :default => {}.to_yaml
      t.timestamps
    end
  end

end

