class AddMidtermToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :midterm, :DateTime
  end
end
