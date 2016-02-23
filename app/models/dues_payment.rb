class DuesPayment < ActiveRecord::Base

  belongs_to :member

  validates :member_id, :presence => true, :on => :create

  scope :ordered, order("date_paid DESC")
  
  scope :most_recent, order("date_paid DESC").limit(1)

end
