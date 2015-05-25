class News < ActiveRecord::Base

  has_paper_trail

  scope :ordered, order("news.date DESC")

end
