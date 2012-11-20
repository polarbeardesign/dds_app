class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :assignments_attributes


  has_many :assignments
  has_many :roles, :through => :assignments



  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

  has_one :member
  accepts_nested_attributes_for :member

end
