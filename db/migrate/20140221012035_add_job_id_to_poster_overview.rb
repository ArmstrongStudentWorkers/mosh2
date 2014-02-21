class AddJobIdToPosterOverview < ActiveRecord::Migration
  def change
    add_column :poster_overviews, :job_id, :integer
  end
end
