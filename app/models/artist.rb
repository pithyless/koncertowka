class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :events, :through => :appearances

  attr_accessible :name, :tagline, :description
end
