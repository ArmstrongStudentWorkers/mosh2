# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  due_date      :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  job_status_id :integer
#

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
