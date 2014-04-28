class RideRequest < ActiveRecord::Base
  has_and_belongs_to_many :events

  scope :general_interest, where("event_id IS NULL")
end
