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
  attr_accessible :name, :price, :image
  has_attached_file :image,
    :styles => {
      :thumb => "75x75#",
      :small => "100x100#",
      :medium => "150x150>",
      :large => "370x280"
    }
end
