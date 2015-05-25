class Manifest < ActiveRecord::Base
  belongs_to :event
  belongs_to :member
  belongs_to :crew_position
  has_paper_trail
end
