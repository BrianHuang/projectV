# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140303053601) do

  create_table "cates", force: true do |t|
    t.string   "name",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_product",   default: false, null: false
    t.boolean  "is_spec",      default: false, null: false
    t.integer  "order",        default: 0,     null: false
    t.string   "unit"
    t.boolean  "is_inv_entry", default: false
    t.boolean  "is_part",      default: false, null: false
  end

  create_table "countries", force: true do |t|
    t.string "abbr"
    t.string "name", null: false
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.string   "addr"
    t.string   "phone"
    t.string   "fax"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.text     "note"
    t.string   "ubn"
  end

  create_table "inv_entries", force: true do |t|
    t.integer "item_id",                       null: false
    t.integer "order_item_id"
    t.integer "qty",               default: 1, null: false
    t.date    "date",                          null: false
    t.text    "note"
    t.integer "inv_entry_cate_id"
    t.integer "order_id"
  end

  create_table "item_parts", force: true do |t|
    t.integer "parent_id",             null: false
    t.integer "item_id",               null: false
    t.integer "qty",       default: 1, null: false
  end

  add_index "item_parts", ["item_id"], name: "index_item_parts_on_item_id", using: :btree
  add_index "item_parts", ["parent_id", "item_id"], name: "index_item_parts_on_parent_id_and_item_id", unique: true, using: :btree
  add_index "item_parts", ["parent_id"], name: "index_item_parts_on_parent_id", using: :btree

  create_table "item_specs", force: true do |t|
    t.integer "item_id",                 null: false
    t.boolean "is_part", default: false, null: false
    t.string  "name",                    null: false
    t.string  "value"
    t.integer "spec_id",                 null: false
    t.integer "part_id"
  end

  add_index "item_specs", ["item_id"], name: "index_item_specs_on_item_id", using: :btree
  add_index "item_specs", ["spec_id", "item_id"], name: "index_item_specs_on_spec_id_and_item_id", unique: true, using: :btree
  add_index "item_specs", ["spec_id"], name: "index_item_specs_on_spec_id", using: :btree

  create_table "items", force: true do |t|
    t.integer  "cate_id",                      null: false
    t.boolean  "is_product",   default: false, null: false
    t.string   "name",                         null: false
    t.string   "ref_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inv",          default: 0
    t.integer  "inv_entry_id"
    t.float    "price"
  end

  add_index "items", ["cate_id"], name: "index_items_on_cate_id", using: :btree
  add_index "items", ["name"], name: "index_items_on_name", unique: true, using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "order_id",               null: false
    t.integer  "item_id",                null: false
    t.integer  "package_id"
    t.integer  "qty",        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "order_mfs", force: true do |t|
    t.integer "order_item_id",             null: false
    t.integer "item_id",                   null: false
    t.integer "amount",        default: 0, null: false
  end

  add_index "order_mfs", ["item_id"], name: "index_order_mfs_on_item_id", using: :btree
  add_index "order_mfs", ["order_item_id"], name: "index_order_mfs_on_order_item_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "status",      limit: 1, default: 0, null: false
    t.integer  "customer_id"
    t.string   "name"
    t.integer  "country_id"
    t.string   "addr"
    t.string   "phone"
    t.string   "fax"
    t.string   "contact"
    t.date     "deadline_at"
    t.date     "ship_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "condition"
    t.text     "note"
    t.string   "email"
    t.string   "payment"
    t.string   "co_no"
    t.date     "date"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "packages", force: true do |t|
    t.string   "name",       null: false
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specs", force: true do |t|
    t.string  "name",         null: false
    t.integer "cate_id"
    t.boolean "is_part"
    t.integer "part_cate_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                         default: "", null: false
    t.string   "encrypted_password",            default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                       null: false
    t.integer  "level",               limit: 1, default: 0
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
