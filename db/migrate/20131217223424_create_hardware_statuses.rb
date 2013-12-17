class CreateHardwareStatuses < ActiveRecord::Migration
  def change
    create_table :hardware_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
