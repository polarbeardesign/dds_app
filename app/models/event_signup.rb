class EventSignup < ActiveRecord::Base

 attr_accessible :event_id, :member_id, :commitment_level, :crew_position_id

  belongs_to :event
  belongs_to :member
  belongs_to :trip
  


  scope :ordered, order("FIELD(commitment_level, 'Definite','Maybe','Canceled')")
  # add created_at as order parameter
  
  scope :member_ordered, joins(:member).merge(Member.ordered)
  
  scope :definite, lambda { where ("commitment_level = ?"), ("Definite") }
  scope :maybe, lambda { where ("commitment_level = ?"), ("Maybe") }
  scope :canceled, lambda { where ("commitment_level = ?"), ("Canceled") }


  scope :airshow_ordered, joins(:event).merge(Event.ordered)
  
  scope :future, joins(:event).merge(Event.published)

  validates_uniqueness_of :member_id, :scope => :event_id

end
