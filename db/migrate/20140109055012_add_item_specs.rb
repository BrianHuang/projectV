class AddItemSpecs < ActiveRecord::Migration
  def change
    create_table 'item_specs', :force => true do |t|
      t.integer 'item_id', :null => false
      t.boolean 'is_part', :null => false , :default => false      
      t.string 'name', :null => false
      t.string 'value', :null => false
      t.integer 'part_id'
    end
  end
end
