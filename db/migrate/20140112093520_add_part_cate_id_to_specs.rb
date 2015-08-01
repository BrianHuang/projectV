class AddPartCateIdToSpecs < ActiveRecord::Migration
  def change
    add_column('specs','part_cate_id',:integer)
  end
end
