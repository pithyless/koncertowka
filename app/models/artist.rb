class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  schema_validations :except => [:image]

  mount_uploader :image, ArtistPhotoUploader
  validates_presence_of :image
  validates_integrity_of :image
  validates_processing_of :image

  has_many :events, :through => :appearances

  attr_accessible :name, :tagline, :description, :image
end
