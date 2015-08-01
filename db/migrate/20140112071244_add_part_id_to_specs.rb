class AddPartIdToSpecs < ActiveRecord::Migration
  def change
    remove_column('specs','is_part')
    add_column('specs','part_id',:integer)
    change_column('specs','value',:string , null: true)
  end
end
