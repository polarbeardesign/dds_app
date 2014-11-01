class Teaser < ActiveRecord::Base

  scope :current, :order => 'created_at DESC'
  scope :limit, lambda { |num| { :limit => num } }

end
