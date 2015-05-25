class RideRequest < ActiveRecord::Base
  has_and_belongs_to_many :events

  validates :last_name, :phone, :email, :city, :state, :presence => true, :on => :create
  has_paper_trail

  scope :general_interest, where("event_id IS NULL")
end
