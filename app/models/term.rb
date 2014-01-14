class Term < ActiveRecord::Base
  belongs_to :officer_position
  belongs_to :member
end
