class OrderStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :work_orders
end
