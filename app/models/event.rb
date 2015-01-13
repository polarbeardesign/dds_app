class Event < ActiveRecord::Base

  belongs_to :event_type
  belongs_to :location
  belongs_to :event_status
  has_many :event_signups
  has_many :members, :through => :event_signups
  has_many :attendances
  has_many :members, :through => :attendances
  has_one :trip
  has_and_belongs_to_many :ride_requests

  validates :start, :end, :event_type_id, :event_statuses_id, :location_id, :presence => true, :on => :create

scope :published, lambda {
  where ("events.start IS NOT NULL AND events.end > ?"), (Time.zone.now - 2.day)
  }

scope :ordered, order("events.start ASC")
scope :reverse, order("events.start DESC")
scope :cat_ordered, order("events.event_type_id ASC", "events.start ASC")
scope :confirmed, where("event_statuses_id = 1")
scope :tease, :limit => 3

scope :meeting, where("event_type_id = 1")
scope :air_show, where("event_type_id = 2")
scope :special, where("event_type_id = 3")
scope :maint, where("event_type_id = 4")

scope :needs_roster, lambda {where("events.flight_roster = ?", true) }
scope :has_lfhe, lambda {where("events.rides_available = ?", true) }

end
