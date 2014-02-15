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

class Semester < ActiveRecord::Base
  attr_accessible :advisement_end, :advisement_start, :end_date, :name, :start_date, :term_id, :year
  belongs_to :term
  has_many :after_hours_accesses

  def name_semester
    self.name = "#{self.term.name} #{self.year}"
  end
end
