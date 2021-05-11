class Content < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :published_at, :slug, :title
end
