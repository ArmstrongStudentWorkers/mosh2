class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :management, :boolean
    add_column :users, :admin, :boolean
    add_column :users, :noncsit, :boolean
  end
end
