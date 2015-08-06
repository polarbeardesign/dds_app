class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates_uniqueness_of :username

  has_many :assignments, :dependent => :destroy
  accepts_nested_attributes_for :assignments

  has_many :roles, :through => :assignments

  has_paper_trail

  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

  has_one :member, :dependent => :destroy

  scope :member_ordered, joins(:member).merge(Member.ordered)

  def self.find_version_author(version)
    find(version.terminator)   
  end

end
