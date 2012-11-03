class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_secure_password
  validates_uniqueness_of :username

  has_many :assignments, :dependent => :destroy
  has_many :roles, :through => :assignments

#  def self.current_user
#    session[:current_user]
#  end

  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

  has_one :member
  accepts_nested_attributes_for :member

end
