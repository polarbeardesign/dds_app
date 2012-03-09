class Product < ActiveRecord::Base

  has_and_belongs_to_many :sizes

  scope :available, where(:available => true)

def total_value
  value + ship_handling
end


end
