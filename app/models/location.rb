class Location < ActiveRecord::Base
  has_many :checkins
end
