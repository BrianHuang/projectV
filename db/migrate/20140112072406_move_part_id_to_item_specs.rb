class MovePartIdToItemSpecs < ActiveRecord::Migration
  def change

    if column_exists?('specs','value')
      remove_column('specs','value')
    end
    if column_exists?('item_specs','part_id')
      remove_column('item_specs','part_id')
    end
    add_column('item_specs','part_id', :integer)
  end
end
