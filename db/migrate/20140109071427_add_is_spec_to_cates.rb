class AddIsSpecToCates < ActiveRecord::Migration
  def change
    add_column :cates, :is_spec, :boolean, :null => false , :default => false
  end
end
