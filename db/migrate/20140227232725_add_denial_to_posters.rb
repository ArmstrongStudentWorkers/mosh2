class AddDenialToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :denial, :text
  end
end
