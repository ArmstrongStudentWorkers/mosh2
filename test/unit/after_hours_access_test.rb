# == Schema Information
#
# Table name: after_hours_accesses
#
#  id          :integer          not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  sid         :string(255)
#  user_id     :integer
#  location_id :integer
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AfterHoursAccessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
