class StudentEvent < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :start_date
end
