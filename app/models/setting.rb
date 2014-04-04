class Setting < ActiveRecord::Base
  attr_accessible :name, :set, :description

  def toggle_set
    if self.set
      self.set = false
    else
      self.set = true
    end
  end
end
