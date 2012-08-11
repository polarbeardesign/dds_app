class User < ActiveRecord::Base

  has_secure_password
  validates_uniqueness_of :username

  has_many :assignments
  has_many :roles, :through => :assignments

  def self.authenticate(username, password) 
    current_user = User.find_by_username(username) 
    unless current_user && current_user.authenticate(password)
      raise "Username or password was invalid"
    end
    current_user
  end

#  def self.current_user
#    session[:current_user]
#  end

  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

  has_one :member
  accepts_nested_attributes_for :member

  def create_reset_code
    @reset = true
    self.attributes = {:reset_code => Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )}
    save(false)
  end

end
