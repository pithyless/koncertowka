class City < ActiveRecord::Base
  has_many :venues

  attr_accessible :city

  def to_s
    self.city
  end
end
