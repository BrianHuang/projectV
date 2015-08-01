class RemoveUnitFromItems < ActiveRecord::Migration
  def change
    remove_column('items','unit')
    add_column('cates','unit',:string)
    change_column('item_parts','amount',:integer,:default => 1)
    rename_column('item_parts','amount','qty')
    rename_column('order_items','quantity','qty')
  end
end
