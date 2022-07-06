class Product < ActiveRecord::Base

  has_and_belongs_to_many :sizes
  has_many :product_photos
  accepts_nested_attributes_for :product_photos, :allow_destroy => true


  scope :available, where(:available => true)
  scope :membership, where(:id => 15)
  default_scope :order => "field(item_no,'100','350','300','500','501','510','600','601','400','401')"

  validates :name, :item_no, :description, :value, :alt_value, :ship_handling, :sizes, :presence => true, :on => :create

  has_paper_trail

#display_order


def total_value
  value + ship_handling
end

  scope :membership, where("products.id IN (15)")

end
