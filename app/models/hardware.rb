class Hardware < ActiveRecord::Base
  attr_accessible :aasu_number, :assigned_to, :hardware_status_comment, :hardware_status_id, :hardware_type_id, :manufacturer, :model_number, :name, :serial_number, :specs, :workstation_id, :year
  belongs_to :hardware_status
  belongs_to :hardware_type
  belongs_to :workstation
  has_many :work_orders
end
