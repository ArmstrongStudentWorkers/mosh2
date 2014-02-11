# == Schema Information
#
# Table name: workstations
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  number              :string(255)
#  workstation_type_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  location_id         :integer
#

require 'test_helper'

class WorkstationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
