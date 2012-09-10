class Order < ActiveRecord::Base
  attr_accessible :address, :cart_id, :email, :name, :pay_type
  PAYMENT_TYPES = ["cheque","credit card","Purchase order"]
end
