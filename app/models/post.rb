class Post < ActiveRecord::Base

  has_and_belongs_to_many :categories
  belongs_to :user

scope :ordered, order("posts.created_at DESC, posts.id DESC")


end
