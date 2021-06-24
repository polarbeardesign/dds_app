class LhfeFlight < ActiveRecord::Base
  belongs_to :event
  belongs_to :aircraft

scope :upcoming, lambda {
  where ("lhfe_flights.flight_start_time IS NOT NULL AND lhfe_flights.flight_start_time > ?"), (Time.zone.now - 2.day)
  }
  
end
