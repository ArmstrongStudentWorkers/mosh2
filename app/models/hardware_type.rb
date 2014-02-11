# == Schema Information
#
# Table name: hardware_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HardwareType < ActiveRecord::Base
  attr_accessible :name
  has_many :hardwares
end
