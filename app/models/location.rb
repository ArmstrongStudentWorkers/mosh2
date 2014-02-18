# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  room             :string(255)
#  comment          :text
#  location_type_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :comment, :location_type_id, :name, :room
  belongs_to :location_type
  has_many :workstations
  has_one :hour
  has_many :after_hours_accesses
  has_paper_trail
end
