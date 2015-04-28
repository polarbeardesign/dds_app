class News < ActiveRecord::Base

scope :ordered, order("news.date DESC")

end
