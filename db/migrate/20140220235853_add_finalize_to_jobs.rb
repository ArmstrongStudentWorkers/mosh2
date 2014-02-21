class AddFinalizeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :finalize, :boolean
  end
end
