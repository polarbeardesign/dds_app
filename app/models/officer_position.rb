class OfficerPosition < ActiveRecord::Base

  has_many :terms
  has_many :members, :through => :terms

end
