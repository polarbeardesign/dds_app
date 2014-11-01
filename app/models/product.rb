class Product < ActiveRecord::Base

  has_and_belongs_to_many :sizes

  scope :available, where(:available => true)
  default_scope :order => "field(item_no,'100','500','501','600','601','400','401')"

def total_value
  value + ship_handling
end


end
