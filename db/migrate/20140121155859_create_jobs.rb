class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.datetime :due_date

      t.timestamps
    end
  end
end
