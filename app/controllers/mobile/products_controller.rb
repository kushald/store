class Mobile::ProductsController < ApplicationController
  skip_before_filter :check_request
  layout "admin"
  def index
    @products = Product.all
  end
end