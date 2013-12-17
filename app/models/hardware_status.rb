class HardwareStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :hardwares
end
