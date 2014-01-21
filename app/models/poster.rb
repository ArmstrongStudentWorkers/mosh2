class Poster < ActiveRecord::Base
  attr_accessible :job_id, :length, :name, :poster_status_id, :special_request, :width, :attachment
  belongs_to :job
  belongs_to :poster_status
  has_attached_file :attachment, :presence => true
end
