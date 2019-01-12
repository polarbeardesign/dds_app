class Term < ActiveRecord::Base
  belongs_to :officer_position
  belongs_to :member
  has_paper_trail

scope :ordered, order("terms.officer_position_id ASC") 
#scope :office_ordered, joins(:officer_position).merge(OfficerPosition.default_scope)

scope :current, lambda {
  where ("terms.term_start IS NOT NULL AND terms.term_start < ? AND terms.term_end > ? "), (Date.today), (Date.today)
  }
scope :past, lambda {
  where ("terms.term_start IS NOT NULL AND terms.term_end < ? "), (Date.today)
  }
scope :time_ordered, order("terms.term_start DESC") 

end


