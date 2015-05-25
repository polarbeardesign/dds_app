class Grant < ActiveRecord::Base

  belongs_to :role
  belongs_to :right
  has_paper_trail

  scope :right_ordered, joins(:right).merge(Right.ordered)



end
