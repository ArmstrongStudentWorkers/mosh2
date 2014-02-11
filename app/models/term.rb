# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Term < ActiveRecord::Base
  attr_accessible :name
  has_many :semesters
end
