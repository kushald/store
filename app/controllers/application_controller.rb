class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  before_filter :current_user
  before_filter :cart_setting
  
  private
  def current_cart
    if session[:cart].present?
      @cart = Cart.where("id=?",session[:cart])
    else
      @cart = Cart.create
      session[:cart] = @cart.id
    end
    @cart
  end
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def cart_setting
		@cart = current_cart
	end
end
