# == Schema Information
#
# Table name: hardware_statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HardwareStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :hardwares
  has_paper_trail
end
