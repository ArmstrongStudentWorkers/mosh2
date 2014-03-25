class MakeStudentDefault < ActiveRecord::Migration
  def up
    change_column :users, :student, :boolean, default: true
  end

  def down
    change_column :users, :student, :boolean, default: nil
  end
end
