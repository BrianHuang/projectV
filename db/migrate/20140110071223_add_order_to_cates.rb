class AddOrderToCates < ActiveRecord::Migration
  def change
    add_column :cates, :order, :integer, :null => false , :default => 0
  end
end
