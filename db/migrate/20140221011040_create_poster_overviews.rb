class CreatePosterOverviews < ActiveRecord::Migration
  def change
    create_table :poster_overviews do |t|
      t.integer :id

      t.timestamps
    end
  end
end
