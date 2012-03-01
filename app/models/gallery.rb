class Gallery < ActiveRecord::Base
  belongs_to :gallery_category
  has_many :photos
end
