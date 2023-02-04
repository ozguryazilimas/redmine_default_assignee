
class ChangeRdaProjectSettingsSerializedDefault < ActiveRecord::Migration[5.2]

  def change
    change_column_default :rda_project_settings, :default_assignee, nil
  end

end

