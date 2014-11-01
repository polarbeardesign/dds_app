class Size < ActiveRecord::Base
  
  has_and_belongs_to_many :product

  scope :by_size, order(:display_order)
  
end
