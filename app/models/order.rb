class Order < ActiveRecord::Base
  attr_accessible :address, :cart_id, :email, :name, :pay_type
  PAYMENT_TYPES = ["check","credit card","Purchase order"]
end
