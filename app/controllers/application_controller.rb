class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  before_filter :current_user
  before_filter :check_request
  
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
  def check_request
    if request.user_agent =~ /Mobile|webOS/ or params[:m].to_i == 1
      redirect_to request.protocol + request.host_with_port + '/mobile' + request.env["REQUEST_PATH"].gsub(/\?full_site=1/, '') and return
    end
  end
end
