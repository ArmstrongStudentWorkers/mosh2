class Workstation < ActiveRecord::Base
  attr_accessible :name, :number, :workstation_type_id, :location_id
  belongs_to :location
  belongs_to :workstation_type
  has_many :hardwares

  def self.find_by_location_and_type(location_name, type)
    location_id = Location.where(name: location_name).first.id
    workstation_type = WorkstationType.where(name: type).first
    workstation_type.workstations.where(location_id: location_id)
  end
end
