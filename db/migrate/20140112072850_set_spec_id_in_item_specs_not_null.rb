class SetSpecIdInItemSpecsNotNull < ActiveRecord::Migration
  def change
    change_column('item_specs','spec_id',:integer , null: false)
  end
end
