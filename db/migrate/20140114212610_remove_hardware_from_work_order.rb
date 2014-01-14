class RemoveHardwareFromWorkOrder < ActiveRecord::Migration
  def up
    remove_column :work_orders, :hardware_id
  end

  def down
    add_column :work_orders, :hardware_id, :string
  end
end
