class Semester < ActiveRecord::Base
  attr_accessible :advisement_end, :advisement_start, :end_date, :name, :start_date, :term_id, :year
  belongs_to :term
  has_many :after_hours_accesses
end
