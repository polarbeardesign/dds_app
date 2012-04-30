class Photo < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :photographer

end
