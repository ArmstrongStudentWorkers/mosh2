class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.boolean :set

      t.timestamps
    end
  end
end
