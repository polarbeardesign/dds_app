class LhfeRider < ActiveRecord::Base
  belongs_to :event
  attr_accessible :city, :dob, :email, :event_id, :first_name, :gender, :home_phone, :last_name, :married, :occupation, :payment_amount, :payment_type, :ride_date, :spouse_name, :state, :street_1, :street_2, :work_phone, :zip
end
