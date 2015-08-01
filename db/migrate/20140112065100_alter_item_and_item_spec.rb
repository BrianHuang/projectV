class AlterItemAndItemSpec < ActiveRecord::Migration
  def change
    #remove_column('item_specs','is_part')
    #remove_column('item_specs','name')
    #remove_column('item_specs','part_id')
    add_column('item_specs','spec_id',:integer)
    
    create_table 'specs', :force => true do |t|
      t.boolean 'is_part', :null => false , :default => false      
      t.string 'name', :null => false
      t.string 'value', :null => false
    end
    
    add_index 'item_specs' , ['spec_id']
    add_index 'item_specs' , ['item_id']
    add_index 'item_specs' , ['spec_id' , 'item_id'] , :unique => true  
  end
end
