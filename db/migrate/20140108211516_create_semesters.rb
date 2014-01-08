class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :name
      t.integer :term_id
      t.string :year
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :advisement_start
      t.datetime :advisement_end

      t.timestamps
    end
  end
end
