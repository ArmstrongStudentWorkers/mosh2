class WorkOrder < ActiveRecord::Base
  attr_accessible :comment, :name, :order_status_id, :user_id, :closed_date, :assignee, :other_number
  belongs_to :user
  belongs_to :order_status
end
