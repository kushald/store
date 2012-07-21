class AddImageToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image_file_name, :string 
    add_column :products, :image_content_type, :string 
    add_column :products, :image_file_size, :float 
  end
end
