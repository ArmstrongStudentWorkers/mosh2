class AddClosedDateToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :closed_date, :datetime
  end
end
