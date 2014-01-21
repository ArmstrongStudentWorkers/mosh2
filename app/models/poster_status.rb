class PosterStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :posters
end
