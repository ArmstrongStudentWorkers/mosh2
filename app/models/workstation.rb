# == Schema Information
#
# Table name: workstations
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  number              :string(255)
#  workstation_type_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  location_id         :integer
#

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
  def name_workstation
    self.name = "#{self.location.name} - #{self.number}"
  end
end
