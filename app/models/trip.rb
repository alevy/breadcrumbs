class Trip < ActiveRecord::Base
  has_many :posts
  has_many :checkins
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
end
