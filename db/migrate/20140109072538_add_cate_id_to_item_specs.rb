class AddCateIdToItemSpecs < ActiveRecord::Migration
  def change
    add_column :item_specs, :cate_id, :integer
  end
end
