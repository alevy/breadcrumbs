module ApplicationHelper
  
  def gravatar(email)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}.png"
  end
  
end
