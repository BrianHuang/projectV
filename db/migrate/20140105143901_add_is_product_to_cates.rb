class AddIsProductToCates < ActiveRecord::Migration
  def change
  	add_column :cates, :is_product, :boolean, :null => false , :default => false
  end
end
