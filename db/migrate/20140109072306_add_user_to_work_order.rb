class AddUserToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :user_id, :integer
  end
end
