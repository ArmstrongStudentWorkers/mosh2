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

class AfterHoursAccess < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :location_id, :semester_id, :sid, :user_id
  belongs_to :location
  belongs_to :semester
  belongs_to :user
end
