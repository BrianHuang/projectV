class SetOrderItemsPackageIdCanBeNull < ActiveRecord::Migration
  def change
    change_column('order_items','package_id',:integer, :null => true)
    remove_index('order_items','package_id')
  end
end
