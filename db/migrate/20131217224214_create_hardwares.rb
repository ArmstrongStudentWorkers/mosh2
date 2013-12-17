class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares do |t|
      t.string :name
      t.string :serial_number
      t.string :aasu_number
      t.string :manufacturer
      t.string :model_number
      t.string :assigned_to
      t.text :specs
      t.integer :hardware_type_id
      t.integer :hardware_status_id
      t.text :hardware_status_comment
      t.integer :workstation_id

      t.timestamps
    end
  end
end
