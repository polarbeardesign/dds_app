class Grant < ActiveRecord::Base

  belongs_to :role
  belongs_to :right

  scope :right_ordered, joins(:right).merge(Right.id_ordered)



end
