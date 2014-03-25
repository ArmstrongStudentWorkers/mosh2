class AddMountingToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :mounting, :boolean
  end
end
