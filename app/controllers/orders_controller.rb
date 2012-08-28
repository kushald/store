class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    @order.cart_id = @cart.id
    respond_to do |format|
      if @order.save
        session[:cart] = nil
        format.html {redirect_to("/orders/thank-you", :notice => 'Thank You for your Order.')}
      else
        format.html {render :action => "new"}
      end
    end
  end
  
  def thank_you
  end
end
