# == Schema Information
#
# Table name: workstation_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WorkstationType < ActiveRecord::Base
  attr_accessible :name
  has_many :workstations
end
