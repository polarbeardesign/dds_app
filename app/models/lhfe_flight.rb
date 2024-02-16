class LhfeFlight < ActiveRecord::Base
  belongs_to :event
  belongs_to :aircraft
  validates :flight_start_time, :event_id, :aircraft_id, :presence => true, :on => :create
  validates :discount_price, :price, numericality: {:greater_than => 300, :message => "'%{value}' is not a valid value" }

scope :upcoming, lambda {
  where ("lhfe_flights.flight_start_time IS NOT NULL AND lhfe_flights.flight_start_time > ?"), (Time.zone.now - 2.day)
  }
  
end
