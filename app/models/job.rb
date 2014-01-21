class Job < ActiveRecord::Base
  attr_accessible :due_date, :user_id
  has_many :posters
  belongs_to :user
end
