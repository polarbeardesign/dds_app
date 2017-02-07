class Sponsor < ActiveRecord::Base
  attr_accessible :logo, :notes, :sponsor_name, :url
end
