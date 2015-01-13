class Attendance < ActiveRecord::Base

  attr_accessible :event_id, :member_id, :commitment_level

  validates_uniqueness_of :member_id, :scope => :event_id

  belongs_to :member
  belongs_to :event

  scope :ordered, order("FIELD(commitment_level, 'Definite','Maybe','Canceled')")

end
