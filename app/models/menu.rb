class Menu < ActiveRecord::Base
  attr_accessible :description, :menu_name
  has_many :menu_items
  
end
