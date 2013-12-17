class Location < ActiveRecord::Base
  attr_accessible :comment, :location_type_id, :name, :room
  belongs_to :location_type
  has_many :workstations
end
