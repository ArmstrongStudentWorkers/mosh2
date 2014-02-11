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

require 'test_helper'

class WorkOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
