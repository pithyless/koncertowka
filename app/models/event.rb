class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :id_and_title, :use => :slugged

  def id_and_title
    "#{id}-#{title}"
  end

  def should_generate_new_friendly_id?
    new_record?
  end

  belongs_to :venue
  belongs_to :promoter, :class_name => 'User'
  has_many   :artists, :through => :appearances

  attr_accessible :title, :description, :venue_id, :start_at, :end_at

  before_validation :set_current_promoter

  validate :validate_end_date_before_start_date

  private

  def validate_end_date_before_start_date
    if end_at && start_at && (end_at < start_at)
      errors.add(:end_at, "Event can't finish before it starts!")
    end
  end

  def set_current_promoter
    if new_record?
      # TODO: current_user
      self[:promoter_id] = User.first.id
    end
    true
  end
end
