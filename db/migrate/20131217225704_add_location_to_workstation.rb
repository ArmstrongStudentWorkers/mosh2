class AddLocationToWorkstation < ActiveRecord::Migration
  def change
    add_column :workstations, :location_id, :integer
  end
end
