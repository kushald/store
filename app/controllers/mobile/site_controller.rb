class Mobile::SiteController < ApplicationController
  skip_before_filter :check_request
  layout "admin"
  def home
  end
  
  def contact_us
    
  end
end
