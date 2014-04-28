class Event < ActiveRecord::Base

  belongs_to :event_type
  belongs_to :location
  has_many :event_signups
  has_many :members, :through => :event_signups
  belongs_to :event_status
  has_one :trip
  has_and_belongs_to_many :ride_requests

scope :published, lambda {
  where ("events.start IS NOT NULL AND events.end > ?"), (Time.zone.now - 2.day)
  }

scope :ordered, order("events.start ASC")
scope :cat_ordered, order("events.event_type_id ASC", "events.start ASC")
scope :confirmed, where("event_statuses_id = 1")
scope :tease, :limit => 4

scope :meeting, where("event_type_id = 1")
scope :air_show, where("event_type_id = 2")
scope :special, where("event_type_id = 3")
scope :maint, where("event_type_id = 4")


end
