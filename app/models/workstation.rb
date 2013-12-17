class Workstation < ActiveRecord::Base
  attr_accessible :name, :number, :workstation_type_id
  belongs_to :location
  belongs_to :workstation_type
  has_many :hardwares
end
