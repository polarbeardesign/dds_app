class Teaser < ActiveRecord::Base

  has_paper_trail
  
  scope :current, :order => 'created_at DESC'
  scope :limit, lambda { |num| { :limit => num } }

end
