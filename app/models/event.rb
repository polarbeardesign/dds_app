class Event < ActiveRecord::Base

  belongs_to :event_type

scope :published, lambda {
#  where ("events.start IS NOT NULL AND events.start >= ?", Time.zone.now)
  where ("events.start IS NOT NULL AND events.start >= ?"), Time.zone.now
  }

scope :ordered, order("events.start ASC")

scope :tease, :limit => 4

end
