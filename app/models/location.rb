class Location < ActiveRecord::Base
  has_many :checkins
  has_many :posts, :through => :checkins
  
  def name
    if administrative_zone
      "#{city} #{administrative_zone}, #{country}"
    else
      "#{city}, #{country}"
    end
  end
  
  def to_json(options)
    options[:methods] ||= []
    options[:methods] << :name
    super(options)
  end
end
