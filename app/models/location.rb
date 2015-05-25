class Location < ActiveRecord::Base

  has_many :events
  has_paper_trail

  scope :ordered, order("locations.short_name ASC")

end
