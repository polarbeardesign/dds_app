class News < ActiveRecord::Base

  has_paper_trail

  scope :ordered, order("news.date DESC")

  scope :current,  lambda {
  where ("news.date IS NOT NULL AND news.date > ?"), (Time.zone.now - 365.day)
  }

  scope :archive,  lambda {
  where ("news.date IS NOT NULL AND news.date < ?"), (Time.zone.now - 365.day)
  }

end
