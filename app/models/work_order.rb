class WorkOrder < ActiveRecord::Base
  attr_accessible :comment, :hardware_id, :name, :order_status_id, :user_id, :closed_date
  belongs_to :user
  belongs_to :hardware
  belongs_to :order_status
end
