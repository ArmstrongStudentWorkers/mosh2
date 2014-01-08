class AddYearToHardware < ActiveRecord::Migration
  def change
    add_column :hardwares, :year, :string
  end
end
