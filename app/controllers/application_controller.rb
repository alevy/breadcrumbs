class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?, :admin
  
  protected
  def authenticate!
    session[:admin] = authenticate_or_request_with_http_basic("Administration") do |username, password|
      user, pass = File.read(File.join(Rails.root, "passwd")).lines.first.split(":")
      username == user && password == pass
    end
    
    redirect_to root_path unless session[:admin]
  end
  
  def admin?
    session[:admin]
  end
  
  def admin
    if admin?
      yield
    end
  end
end
