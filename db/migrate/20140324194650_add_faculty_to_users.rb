class AddFacultyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :faculty, :boolean
  end
end
