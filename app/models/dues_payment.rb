class DuesPayment < ActiveRecord::Base

  belongs_to :member

  validates :member_id, :presence => true, :on => :create

  scope :ordered, order("date_paid DESC")
  
  scope :most_recent, order("date_paid DESC").limit(1)
  
  scope :current, lambda {
  where ("dues_payments.date_paid IS NOT NULL AND dues_payments.date_paid > ?"), (Time.zone.now - 1.year)
  }

  scope :past_due, lambda {
  where ("dues_payments.date_paid IS NOT NULL AND dues_payments.date_paid < ?"), (Time.zone.now - 1.year)
  }

end
