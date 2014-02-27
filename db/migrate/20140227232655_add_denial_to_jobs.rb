class AddDenialToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :denial, :text
  end
end
