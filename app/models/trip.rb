class Trip < ActiveRecord::Base
  belongs_to :event
  accepts_nested_attributes_for :event, :allow_destroy => true
  has_many :event_signups, :through => :event
end
