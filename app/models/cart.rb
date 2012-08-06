class Cart < ActiveRecord::Base
   attr_accessible :product_id
  after_create :after_cart_create
  private
  def after_cart_create
  end
  def self.item_details(params)
    cart_items = CartItem.where(:cart_id => params[:cart_id]).collect(&:product_id).uniq
    products = Product.where("id IN (?)", cart_items)
    {:cart_items => cart_items, :products => products}
  end
end
