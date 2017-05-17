class Location < ActiveRecord::Base

  has_many :events
  has_paper_trail

  def shortname_with_code
    "#{self.short_name} - #{self.icao_identifier}"
  end

  scope :ordered, order("locations.short_name ASC")

end
