class Location < ActiveRecord::Base
  has_many :checkins
  
  def name
    if administrative_zone
      "#{city} #{administrative_zone}, #{country}"
    else
      "#{city}, #{country}"
    end
  end
end
