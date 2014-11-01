class Video < ActiveRecord::Base

  scope :published, where("publish = TRUE")

  scope :by_date, order("date DESC")

end
