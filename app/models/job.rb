class Job < ActiveRecord::Base
  attr_accessible :due_date, :user_id, :job_status_id
  has_many :posters
  belongs_to :user
  belongs_to :job_status

  def set_pending
    self.job_status = JobStatus.where(name: "Pending").first
  end
  def set_finished
    self.job_status = JobStatus.where(name: "Finished").first
  end
  def set_denied
    self.job_status = JobStatus.where(name: "Denied").first
  end
end
