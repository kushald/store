class CartsController < ApplicationController
  def index
    @cart = Cart.all
  end
  
  # Insert into cart items.
  def insert_into_cart
    return if params[:product_id].blank?
    Cart.create
    render :json => params and return
  end
end
