class CreatePosterStatuses < ActiveRecord::Migration
  def change
    create_table :poster_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
