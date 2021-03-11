class DuesPayment < ActiveRecord::Base

  belongs_to :member

  validates :member_id, :presence => true, :on => :create

  scope :ordered, order("date_paid DESC")
  
  scope :most_recent, order("date_paid DESC").limit(1)
  
  scope :current, lambda {
  where ("dues_payments.date_paid IS NOT NULL AND dues_payments.date_paid > ?"), (Time.zone.now - 1.year)
  }

  scope :past_due, lambda {
  where ("dues_payments.date_paid IS NOT NULL AND dues_payments.date_paid < ?"), (1.year.ago.to_date)
  }

#Scopes for email reminders

# find members whose due date is less than 13 months?
# but not more than 15 month?

  scope :expires_in_one_month, lambda { 
  where ("dues_payments.date_paid IS NOT NULL AND dues_payments.date_paid < ?"), (11.months.ago.to_date)
  }
  
#  expires_at: 1.month.from_now.to_date) }
# joins(:member)merge(Member.ordered).
end
