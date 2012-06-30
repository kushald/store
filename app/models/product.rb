# == Schema Information
#
# Table name: products
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  price      :integer(10)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :name, :price
end
