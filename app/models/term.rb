class Term < ActiveRecord::Base
  belongs_to :officer_position
  belongs_to :member

scope :current, lambda {
  where ("terms.term_start IS NOT NULL AND terms.term_start < ? AND terms.term_end > ? "), (Date.today), (Date.today)
  }

end
