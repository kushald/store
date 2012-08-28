class CartsController < ApplicationController
  def index
    CartItem.delete_all(["cart_id = ? AND product_id = ?",@cart.id.to_i,params[:product_id]]) if request.xhr? and params[:product_id].present?
    @items = Cart.item_details(:cart_id => @cart.try(:id).to_i)
    render :layout => false if request.xhr?
  end
  
  # Insert into cart items.
  def insert_into_cart
    return if params[:product_id].blank?
    present = CartItem.where("cart_id = ? AND product_id = ?", @cart.id, params[:product_id]).first
    if present.present?
      present.quantity += 1
      present.save
    else
      @cart_item = CartItem.create(:cart_id => @cart.id,:product_id => params[:product_id],:quantity => 1)
    end
    respond_to do |format|
      format.js{
        render :template => "/carts/insert_into_cart"
      }
    end
  end
end
