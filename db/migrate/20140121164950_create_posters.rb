class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :name
      t.integer :length
      t.integer :width
      t.text :special_request
      t.integer :job_id
      t.integer :poster_status_id

      t.timestamps
    end
  end
end
