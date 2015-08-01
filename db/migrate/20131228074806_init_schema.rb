class InitSchema < ActiveRecord::Migration
  def up
    create_table 'cates' , :force => true do |t|
      t.string 'name' , :null => false
      t.timestamps
    end

    create_table 'items' , :force => true do |t|
      t.integer 'cate_id' , :null => false
      t.boolean 'is_product' , :null => false , :default => false
      t.string 'name' , :null => false
      t.string 'unit' , :null => false
      t.string 'serial' , :null => false
      t.string 'ref_no'
      t.timestamps
    end
    add_index 'items' , ['cate_id']
    add_index 'items' , ['serial'] , :unique => true

## 應加入item庫存
    # create_table 'item_specs' :force => true do |t|
    #   t.integer 'item_id', :null => false
    #   t.text 'config'
    #   t.string 'name', :null => false
    # end
    # 
    # create_table 'item_spec_patterns' :force => true do |t|
    #   t.text 'config'
    #   t.string 'name', :null => false
    # end

    create_table 'item_parts' , :force => true do |t|
      t.integer 'parent_id' , :null => false
      t.integer 'item_id' , :null => false
      t.integer 'amount' , :limit => 2 , :null => false , :default => 0
    end
    add_index 'item_parts' , ['parent_id']
    add_index 'item_parts' , ['item_id']
    add_index 'item_parts' , ['parent_id' , 'item_id'] , :unique => true

    create_table 'packages' , :force => true do |t|
      t.string 'name' , :null => false
      t.string 'size'
      t.timestamps
    end

    create_table 'customers' , :force => true do |t|
      t.string 'name'
      t.integer 'country'
      t.string 'addr'
      t.string 'phone'
      t.string 'fax'
      t.string 'contact'
      t.timestamps
    end

    create_table 'orders' , :force => true do |t|
      t.integer 'status' , :limit => 1 , :null => false , :default => 0

      #customer
      t.integer 'customer_id'
      t.string 'name'
      t.integer 'country'
      t.string 'addr'
      t.string 'phone'
      t.string 'fax'
      t.string 'contact'
      #customer

      t.date 'deadline_at'
      t.date 'ship_at'

      t.text 'memo'

      t.timestamps
    end
    add_index 'orders' , ['customer_id']

    create_table 'order_items' , :force => true do |t|
      t.integer 'order_id' , :null => false
      t.integer 'item_id' , :null => false
      t.integer 'package_id' , :null => false
      t.integer 'quantity' , :default => 0 , :null => false
      t.timestamps
    end
    add_index 'order_items' , ['order_id']
    add_index 'order_items' , ['item_id']
    add_index 'order_items' , ['package_id']

    create_table 'order_mfs' , :force => true do |t|
      t.integer 'order_item_id' , :null => false
      t.integer 'item_id' , :null => false
      t.integer 'amount' , :null => false , :default => 0
    end
    add_index 'order_mfs' , ['order_item_id']
    add_index 'order_mfs' , ['item_id']
  end

  def down
    drop_table 'cates'
    drop_table 'items'
    drop_table 'item_parts'
    drop_table 'item_specs'
    drop_table 'item_spec_patterns'
    drop_table 'packages'
    drop_table 'customers'
    drop_table 'orders'
    drop_table 'order_items'
    drop_table 'order_mfs'
  end
end
