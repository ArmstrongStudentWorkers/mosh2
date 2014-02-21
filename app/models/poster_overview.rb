class PosterOverview < ActiveRecord::Base
  attr_accessible :id, :job_id
  belongs_to :job
end
