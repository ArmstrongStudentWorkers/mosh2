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
  attr_accessible :due_date, :user_id, :job_status_id, :finalize, :denial
  has_one :poster_overview
  has_many :posters, :dependent => :destroy
  belongs_to :user, :class_name => "User", :foreign_key => :user_id
  belongs_to :job_status
  has_paper_trail

  validate :check_date, if: :should_validate_date?

  def format_date
    self.due_date.strftime('%m/%d/%Y')
  end
  def check_date
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "Posters cannot be due before today!")
    end
  end
  def should_validate_date?
   new_record? || due_date_changed?
  end
  def set_pending
    self.job_status = JobStatus.where(name: "Pending").first
  end
  def set_finished
    self.job_status = JobStatus.where(name: "Finished").first
  end
  def set_denied
    self.job_status = JobStatus.where(name: "Denied").first
  end
  def set_finalize
    self.finalize = true
  end
  def get_mounting
    mount = false
    self.posters.each do |poster|
      if poster.mounting
        mount = true
      end
    end
    mount
  end
  def self.search(search)
    if search
      joins(:user).where('email LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
