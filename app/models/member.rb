class Member < ActiveRecord::Base

  belongs_to :user

  scope :active, where("members.active = 1")

  scope :ordered, order("members.last_name ASC")

end
