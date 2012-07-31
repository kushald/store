class Cart < ActiveRecord::Base
   attr_accessible :product_id
  after_create :after_cart_create
  private
  def after_cart_create
  end
end
