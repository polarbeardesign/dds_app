class Member < ActiveRecord::Base

#  has_one :user, :dependent => :destroy

  belongs_to :user
  accepts_nested_attributes_for :user, :allow_destroy => true
  
#  has_many :event_signups
  has_many :events, :through => :event_signups

  scope :active, where("members.active = 1")

  scope :ordered, order("members.last_name ASC")

end
