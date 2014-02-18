# == Schema Information
#
# Table name: work_orders
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  order_status_id :integer
#  comment         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  closed_date     :datetime
#  assignee        :string(255)
#  other_number    :string(255)
#

class WorkOrder < ActiveRecord::Base
  attr_accessible :comment, :name, :order_status_id, :user_id, :closed_date, :assignee, :other_number
  belongs_to :user
  belongs_to :order_status
  has_paper_trail
end
