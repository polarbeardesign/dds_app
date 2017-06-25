class Post < ActiveRecord::Base

  has_and_belongs_to_many :categories
  belongs_to :user
  has_paper_trail :class_name => 'PostVersion',
      :meta => { :author_username => :user_name}
      
scope :ordered, order("posts.publish_date DESC, posts.id DESC")


end
