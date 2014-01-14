class Event < ActiveRecord::Base

  belongs_to :event_type
  belongs_to :location
  has_many :event_signups
  has_many :members, :through => :event_signups


scope :published, lambda {
#  where ("events.start IS NOT NULL AND events.start >= ?", Time.zone.now)
  where ("events.start IS NOT NULL AND events.end > ?"), (Time.zone.now - 2.day)
  }

scope :ordered, order("events.start ASC")

scope :tease, :limit => 4

end
