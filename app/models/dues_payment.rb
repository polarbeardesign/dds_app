class DuesPayment < ActiveRecord::Base
  belongs_to :member

  scope :ordered, order("date_paid DESC")

end
