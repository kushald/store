class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity, :user_id
end
