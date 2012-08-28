class Cart < ActiveRecord::Base
   attr_accessible :product_id
  after_create :after_cart_create
  private
  def after_cart_create
  end
  def self.item_details(params)
    sum = 0
    cart_items = CartItem.where(:cart_id => params[:cart_id]).order("updated_at desc").index_by(&:product_id)
    products = Product.where("id IN (?)", cart_items.keys).index_by(&:id)
    cart_items.each{|i| sum+= i[1].quantity.to_i}
    {:cart_items => cart_items, :products => products, :quantity => sum.to_i}
  end
end
