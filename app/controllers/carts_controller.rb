class CartsController < ApplicationController
  def index
    @cart = Cart.all
  end
  
  # Insert into cart items.
  def insert_into_cart
    return if params[:product_id].blank?
    @cart_item = CartItem.create(:cart_id => @cart.id,:product_id => params[:product_id])
    
     respond_to do |format|
    format.js{
      render :template => "/carts/insert_into_cart"
    }
  end
  end
end
