class AddInvEntry < ActiveRecord::Migration
  def change
    create_table "inv_entries", force: true do |t|
      t.integer "item_id", null: false
      t.integer "order_item_id"
      t.boolean "sign", null: false
      t.integer "qty", default: 1, null: false
      t.string "name", null: false
      t.date "date", null: false
    end
    add_column('items','inv_entry_id',:integer)
  end
end
