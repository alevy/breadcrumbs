class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_format_of :email, :with => /^[\w\d\.]+@[\w\d\.]+$/, :on => :create, :message => "is invalid"
  validates_presence_of :comment, :on => :create, :message => "can't be blank"
end
