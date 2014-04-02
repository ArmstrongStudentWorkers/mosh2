class AddDescriptionToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :description, :text
  end
end
