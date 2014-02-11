# == Schema Information
#
# Table name: poster_statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PosterStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :posters
end
