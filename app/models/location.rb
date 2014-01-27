class Location < ActiveRecord::Base

  has_many :events

  scope :ordered, order("locations.short_name ASC")

end
