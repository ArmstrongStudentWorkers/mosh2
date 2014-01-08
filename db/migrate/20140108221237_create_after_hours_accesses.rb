class CreateAfterHoursAccesses < ActiveRecord::Migration
  def change
    create_table :after_hours_accesses do |t|
      t.string :first_name
      t.string :last_name
      t.string :sid
      t.integer :user_id
      t.integer :location_id
      t.integer :semester_id

      t.timestamps
    end
  end
end
