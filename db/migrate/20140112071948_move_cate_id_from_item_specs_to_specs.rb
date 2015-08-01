class MoveCateIdFromItemSpecsToSpecs < ActiveRecord::Migration
  def change
    remove_column('item_specs','cate_id')
    add_column('specs','cate_id',:integer)
  end
end
