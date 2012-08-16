class Member < ActiveRecord::Base

  belongs_to :user
  has_many :event_signups
  has_many :events, :through => :event_signups

  scope :active, where("members.active = 1")

  scope :ordered, order("members.last_name ASC")

end
