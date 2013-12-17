class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :room
      t.text :comment
      t.integer :location_type_id

      t.timestamps
    end
  end
end
