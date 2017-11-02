class DuesReminder < ActiveRecord::Base

  attr_accessible :date_sent, :member_id, :notice_name, :sent_to, :text_sent

  belongs_to :member
  
end
