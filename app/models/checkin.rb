class Checkin < ActiveRecord::Base
  belongs_to :trip
  belongs_to :location
  
  def location_name
    location.name
  end
end
