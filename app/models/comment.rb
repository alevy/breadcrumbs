class Comment < ActiveRecord::Base
  belongs_to :post
  
  scope :approved, where(:approved => true)
  scope :pending, where(:approved => false)
  
  def website=(url)
    url = url.downcase
    unless url =~ /^[a-z]+:\/\//
      url = "http://" + url
    end
    super(url)
  end
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_format_of :email, :with => /^[\w\d\.]+@[\w\d\.]+$/, :on => :create, :message => "is invalid"
  validates_presence_of :comment, :on => :create, :message => "can't be blank"
  validates_format_of :website, :with => /^https?:\/\//, :on => :create, :message => "must begin with http:// or https://"
end
