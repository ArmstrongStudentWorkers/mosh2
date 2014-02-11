# == Schema Information
#
# Table name: hours
#
#  id          :integer          not null, primary key
#  monday      :string(255)
#  tuesday     :string(255)
#  wednesday   :string(255)
#  thursday    :string(255)
#  friday      :string(255)
#  saturday    :string(255)
#  sunday      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#

require 'test_helper'

class HourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
