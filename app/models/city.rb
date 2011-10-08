class City < ActiveRecord::Base
  has_many :venues

  attr_accessible :city
end
