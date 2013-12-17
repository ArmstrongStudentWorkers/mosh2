class CreateWorkstations < ActiveRecord::Migration
  def change
    create_table :workstations do |t|
      t.string :name
      t.string :number
      t.integer :workstation_type_id

      t.timestamps
    end
  end
end
