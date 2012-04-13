class User < ActiveRecord::Base

  has_secure_password
  validates_uniqueness_of :username

  has_many :assignments
  has_many :roles, :through => :assignments

  def self.authenticate(username, password) 
    user = User.find_by_username(username) 
    unless user && user.authenticate(password)
      raise "Username or password invalid"
    end
    user
  end

  def self.current_user

  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

end
