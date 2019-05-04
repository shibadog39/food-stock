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

ActiveRecord::Schema.define(version: 2019_05_03_075254) do

  create_table "actual_stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.integer "quantity", default: 0
    t.date "counted_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "counted_at"], name: "index_actual_stocks_on_item_id_and_counted_at", unique: true
    t.index ["item_id"], name: "index_actual_stocks_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.bigint "supplier_id", null: false
    t.string "name", null: false
    t.integer "category", default: 0, null: false
    t.integer "lead_time"
    t.integer "price"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_items_on_shop_id"
    t.index ["supplier_id"], name: "index_items_on_supplier_id"
  end

  create_table "order_stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "item_id"
    t.integer "quantity"
    t.datetime "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_stocks_on_item_id"
    t.index ["shop_id"], name: "index_order_stocks_on_shop_id"
  end

  create_table "proper_stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "item_id"
    t.integer "date_type"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_proper_stocks_on_item_id"
    t.index ["shop_id"], name: "index_proper_stocks_on_shop_id"
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "tel"
    t.string "address"
    t.text "memo"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_shops_on_email", unique: true
  end

  create_table "suppliers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "name", null: false
    t.string "tel"
    t.string "fax"
    t.string "email"
    t.integer "lead_time"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_suppliers_on_shop_id"
  end

  add_foreign_key "order_stocks", "items"
  add_foreign_key "order_stocks", "shops"
  add_foreign_key "proper_stocks", "items"
  add_foreign_key "proper_stocks", "shops"
end
