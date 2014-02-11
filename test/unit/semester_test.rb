# == Schema Information
#
# Table name: semesters
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  term_id          :integer
#  year             :string(255)
#  start_date       :datetime
#  end_date         :datetime
#  advisement_start :datetime
#  advisement_end   :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
