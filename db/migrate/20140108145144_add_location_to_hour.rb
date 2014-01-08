class AddLocationToHour < ActiveRecord::Migration
  def change
    add_column :hours, :location_id, :integer
  end
end
