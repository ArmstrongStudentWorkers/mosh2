# == Schema Information
#
# Table name: location_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LocationType < ActiveRecord::Base
  attr_accessible :name
  has_many :locations
end
