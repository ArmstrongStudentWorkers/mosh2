# == Schema Information
#
# Table name: job_statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JobStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :jobs
end
