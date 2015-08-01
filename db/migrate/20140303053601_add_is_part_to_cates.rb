class AddIsPartToCates < ActiveRecord::Migration
  def change
    add_column :cates, :is_part, :boolean, :null => false , :default => false
  end
end
