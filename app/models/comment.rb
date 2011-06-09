class Comment < ActiveRecord::Base
  belongs_to :post
  
  scope :approved, where(:approved => true)
  scope :pending, where(:approved => false)
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_format_of :email, :with => /^[\w\d\.]+@[\w\d\.]+$/, :on => :create, :message => "is invalid"
  validates_presence_of :comment, :on => :create, :message => "can't be blank"
end
