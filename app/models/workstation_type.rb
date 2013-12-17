class WorkstationType < ActiveRecord::Base
  attr_accessible :name
  has_many :workstations
end
