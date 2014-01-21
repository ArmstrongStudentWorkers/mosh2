class AddJobStatusToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :job_status_id, :integer
  end
end
