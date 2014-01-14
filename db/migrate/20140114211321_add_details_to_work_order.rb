class AddDetailsToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :assignee, :string
    add_column :work_orders, :other_number, :string
  end
end
