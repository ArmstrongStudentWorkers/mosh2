class CreateWorkstationTypes < ActiveRecord::Migration
  def change
    create_table :workstation_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
