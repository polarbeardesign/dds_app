class EventSignup < ActiveRecord::Base

 attr_accessible :event_id, :member_id, :commitment_level

  belongs_to :event
  belongs_to :member

scope :ordered, order("commitment_level ASC, created_at ASC")

  validates_uniqueness_of :member_id, :scope => :event_id

end
