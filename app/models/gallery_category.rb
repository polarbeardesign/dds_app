class GalleryCategory < ActiveRecord::Base
  has_many :galleries
end
