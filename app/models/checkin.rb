class Checkin < ActiveRecord::Base
  belongs_to :trip
  belongs_to :location
  has_many :posts
  
  def location_name
    location.name
  end
end
