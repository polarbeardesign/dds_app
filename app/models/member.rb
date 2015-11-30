class Member < ActiveRecord::Base

  attr_accessible :id, :first_name, :last_name, :home_phone, :zip, :city, :dd_dues_date, :work_phone, :state, :user_attributes, :cell_phone, :caf_col_no, :active, :street_2, :street_1, :ec_name, :ec_phone, :caf_join_date
  belongs_to :user
  accepts_nested_attributes_for :user, :allow_destroy => true
  
  has_many :event_signups
  has_many :events, :through => :event_signups
  has_many :terms
  has_many :officer_positions, :through => :terms
  has_paper_trail

  scope :active, where("members.active = 1")
  scope :inactive, where("members.active = 0")

  scope :ordered, order("active DESC, members.last_name ASC, members.first_name ASC")

  def full_name
    self.last_name + ', ' + self.first_name
  end

	def self.to_csv
		FasterCSV.generate do |csv|
			csv << ["id","CAF Col No","First Name","Last Name","Address 1","Address 2","City","State","Zip","Phone -home","Phone -work","Phone -mobile","Email","active","Join Date","Dues Date"] 
			all.each do |member|
				csv << [member.id,member.caf_col_no,member.first_name,member.last_name,member.street_1,member.street_2,member.city,member.state,member.zip,member.home_phone,member.work_phone,member.cell_phone,member.email,member.active,member.join_date,member.dd_dues_date]
			end
		end
	end    

end
