class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  before_filter :current_user

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
