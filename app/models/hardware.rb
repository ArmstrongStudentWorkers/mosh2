# == Schema Information
#
# Table name: hardwares
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  serial_number           :string(255)
#  aasu_number             :string(255)
#  manufacturer            :string(255)
#  model_number            :string(255)
#  assigned_to             :string(255)
#  specs                   :text
#  hardware_type_id        :integer
#  hardware_status_id      :integer
#  hardware_status_comment :text
#  workstation_id          :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  year                    :string(255)
#

class Hardware < ActiveRecord::Base
  attr_accessible :aasu_number, :assigned_to, :hardware_status_comment, :hardware_status_id, :hardware_type_id, :manufacturer, :model_number, :name, :serial_number, :specs, :workstation_id, :year
  belongs_to :hardware_status
  belongs_to :hardware_type
  belongs_to :workstation
  has_many :work_orders
end
