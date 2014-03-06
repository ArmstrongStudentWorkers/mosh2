class RemoveDeniedFromPosters < ActiveRecord::Migration
  def up
    remove_column :posters, :denied
  end

  def down
    add_column :posters, :denied, :text
  end
end
