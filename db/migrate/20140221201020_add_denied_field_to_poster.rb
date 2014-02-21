class AddDeniedFieldToPoster < ActiveRecord::Migration
  def change
    add_column :posters, :denied, :text
  end
end
