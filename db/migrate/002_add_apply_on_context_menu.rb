class AddApplyOnContextMenu < ActiveRecord::Migration[4.2]

  def change
    add_column :rda_project_settings, :apply_on_context_menu, :boolean, :default => false
  end

end

