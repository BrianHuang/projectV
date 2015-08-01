class AllowItemSpecsValueToBlank < ActiveRecord::Migration
  def change
    change_column('item_specs','value',:string,:null => true)
  end
end
