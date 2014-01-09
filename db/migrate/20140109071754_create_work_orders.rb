class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string :name
      t.integer :order_status_id
      t.text :comment
      t.integer :hardware_id

      t.timestamps
    end
  end
end
