class OfficerPosition < ActiveRecord::Base

  has_many :terms
  has_many :members, :through => :terms
  has_paper_trail

  default_scope :order => "field(position_name,'Unit Leader','Executive Officer','Finance Officer','Operations Officer','Maintenance Officer','Safety Officer','Adjutant','Education Officer','Development Officer')"

end
