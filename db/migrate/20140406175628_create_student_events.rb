class CreateStudentEvents < ActiveRecord::Migration
  def change
    create_table :student_events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.text :description

      t.timestamps
    end
  end
end
