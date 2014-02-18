# == Schema Information
#
# Table name: order_statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :work_orders
  has_paper_trail
end
