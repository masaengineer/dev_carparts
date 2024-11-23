# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_11_23_155852) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.bigint "sku_id", null: false, comment: "Foreign key to SKU"
    t.integer "quantity", null: false, comment: "Quantity of the item"
    t.decimal "price", precision: 10, scale: 2, null: false, comment: "Price of the item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["sku_id"], name: "index_order_items_on_sku_id"
  end

  create_table "order_status_histories", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.string "order_status", null: false, comment: "Current status of the order"
    t.datetime "status_change_date", null: false, comment: "Date when the status was changed"
    t.string "changed_by", comment: "User who changed the status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_status_histories_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number", null: false, comment: "Unique order identifier"
    t.date "sale_date", comment: "Date the order is confirmed"
    t.integer "channel_id", comment: "Foreign key to channel"
    t.integer "tool_user_id", comment: "Foreign key to tool user"
    t.integer "buyer_id", comment: "Foreign key to buyer"
    t.string "order_status", comment: "Order status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_number"], name: "index_orders_on_order_number", unique: true
  end

  create_table "sales_channels", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.string "channel_name", null: false, comment: "Name of the sales channel"
    t.string "export_domestic_flag", comment: "Flag for domestic export"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_sales_channels_on_order_id"
  end

  create_table "skus", force: :cascade do |t|
    t.string "name", null: false, comment: "SKU name"
    t.decimal "price", precision: 10, scale: 2, null: false, comment: "SKU price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_picture_url"
    t.string "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "skus"
  add_foreign_key "order_status_histories", "orders"
  add_foreign_key "sales_channels", "orders"
end
