class Attendance < ActiveRecord::Base

  attr_accessible :event_id, :member_id, :commitment_level

  validates_uniqueness_of :member_id, :scope => :event_id

  belongs_to :member
  belongs_to :event
  has_paper_trail

  scope :ordered, order("FIELD(commitment_level, 'Definite','Maybe','Canceled')")

  scope :definite, lambda { where ("commitment_level = ?"), ("Definite") }
  scope :maybe, lambda { where ("commitment_level = ?"), ("Maybe") }
  scope :canceled, lambda { where ("commitment_level = ?"), ("Canceled") }

end
