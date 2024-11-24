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

ActiveRecord::Schema[7.0].define(version: 2024_11_23_161947) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_primary", null: false, comment: "Primary part of the address"
    t.string "address_secondary", comment: "Additional address information (optional)"
    t.string "city", null: false
    t.string "state_province", null: false
    t.string "postal_code", null: false
    t.string "country", null: false
    t.string "address_formats", comment: "Formats of the address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertising_costs", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.decimal "product_ad_cost", precision: 10, scale: 2, comment: "Advertising cost for the product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_advertising_costs_on_order_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "name", null: false, comment: "Name of the buyer"
    t.bigint "address_id", comment: "Foreign key to addresses"
    t.string "email", comment: "Email of the buyer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_buyers_on_address_id"
    t.index ["name"], name: "index_buyers_on_name"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "year", null: false, comment: "Year of the expense"
    t.integer "month", null: false, comment: "Month of the expense"
    t.string "item_name", null: false, comment: "Name of the expense item"
    t.decimal "amount", precision: 10, scale: 2, null: false, comment: "Amount of the expense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "oem_part_number", null: false, comment: "OEM part number"
    t.boolean "is_oem", null: false, comment: "Indicates if it is an OEM part"
    t.string "domestic_title", comment: "Domestic title"
    t.string "international_title", comment: "International title"
    t.bigint "product_categories_id", comment: "Foreign key to product categories"
    t.string "product_status", comment: "Product status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_categories_id"], name: "index_products_on_product_categories_id"
  end
  
  create_table "inventories", force: :cascade do |t|
    t.bigint "product_id", null: false, comment: "Foreign key to products"
    t.integer "quantity", null: false, comment: "Quantity in inventory"
    t.date "stock_order_date", comment: "Date of stock order"
    t.string "stock_type", comment: "Type of inventory (e.g., own, manufacturer, wholesaler)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

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

  create_table "payment_fees", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.string "fee_type", comment: "Type of fee"
    t.decimal "fee_rate", precision: 5, scale: 4, comment: "Fee rate (e.g., 0.03 for 3%)"
    t.integer "option", comment: "Fee option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payment_fees_on_order_id"
  end

  create_table "procurements", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.decimal "purchase_price", precision: 10, scale: 2, comment: "Purchase price"
    t.decimal "domestic_transfer_fee", precision: 10, scale: 2, comment: "Domestic transfer fee"
    t.decimal "forwarding_fee", precision: 10, scale: 2, comment: "Forwarding fee"
    t.decimal "photo_fee", precision: 10, scale: 2, comment: "Photo fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_procurements_on_order_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "category_name", null: false, comment: "Name of the category"
    t.string "description", comment: "Description of the category"
    t.bigint "parent_category_id", comment: "Self-referencing for subcategories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_category_id"], name: "index_product_categories_on_parent_category_id"
  end

  create_table "quotation_item_changes", force: :cascade do |t|
    t.bigint "quotation_item_id", null: false, comment: "Foreign key to quotation items"
    t.string "original_part_number", comment: "Original part number"
    t.string "new_part_number", comment: "New part number"
    t.datetime "change_date", null: false, comment: "Date of the change"
    t.string "change_reason", comment: "Reason for the change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_item_id"], name: "index_quotation_item_changes_on_quotation_item_id"
  end

  create_table "quotation_items", force: :cascade do |t|
    t.bigint "quotation_id", null: false, comment: "Foreign key to quotations"
    t.bigint "product_id", null: false, comment: "Foreign key to products"
    t.integer "quantity", null: false, comment: "Quantity of the product"
    t.decimal "estimated_price", precision: 10, scale: 2, comment: "Estimated price of the product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_quotation_items_on_product_id"
    t.index ["quotation_id"], name: "index_quotation_items_on_quotation_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.bigint "wholesaler_id", null: false, comment: "Foreign key to wholesalers"
    t.date "quotation_date", null: false, comment: "Date of the quotation"
    t.string "status", comment: "Quotation status"
    t.date "estimated_delivery", comment: "Estimated delivery date"
    t.text "wholesaler_remarks", comment: "Remarks from wholesaler"
    t.text "notes", comment: "Additional notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wholesaler_id"], name: "index_quotations_on_wholesaler_id"
  end

  create_table "remarks", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.string "partner_note", comment: "Note for the partner"
    t.string "internal_note", comment: "Internal note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_remarks_on_order_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.decimal "price_original", precision: 10, scale: 2, comment: "Original price"
    t.string "currency_code", comment: "Currency code"
    t.decimal "conversion_rate", precision: 10, scale: 6, comment: "Conversion rate"
    t.decimal "price_jpy", precision: 10, scale: 2, comment: "Price in JPY"
    t.date "conversion_date", comment: "Currency conversion date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_sales_on_order_id"
  end

  create_table "sales_channel_fees", force: :cascade do |t|
    t.bigint "sales_channel_id", null: false, comment: "Foreign key to sales channels"
    t.decimal "fee_rate", precision: 5, scale: 4, comment: "Fee rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_channel_id"], name: "index_sales_channel_fees_on_sales_channel_id"
  end

  create_table "sales_channels", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.string "channel_name", null: false, comment: "Name of the sales channel"
    t.string "export_domestic_flag", comment: "Flag for domestic export"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_sales_channels_on_order_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "order_id", null: false, comment: "Foreign key to orders"
    t.string "carrier", comment: "Shipping carrier"
    t.string "shipping_method", comment: "Method of shipping"
    t.float "weight", comment: "Weight of the shipment"
    t.float "length", comment: "Length of the shipment"
    t.float "width", comment: "Width of the shipment"
    t.float "height", comment: "Height of the shipment"
    t.string "destination_country", comment: "Destination country"
    t.string "tracking_number", comment: "Tracking number"
    t.float "customer_domestic_shipping", comment: "Domestic shipping cost"
    t.float "customer_international_shipping", comment: "International shipping cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipments_on_order_id"
  end

  create_table "sku_part_number_links", force: :cascade do |t|
    t.bigint "sku_id", null: false, comment: "Foreign key to SKUs"
    t.bigint "product_id", null: false, comment: "Foreign key to products"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sku_part_number_links_on_product_id"
    t.index ["sku_id"], name: "index_sku_part_number_links_on_sku_id"
  end

  create_table "skus", force: :cascade do |t|
    t.string "code", null: false, comment: "SKU name"
    t.decimal "price", precision: 10, scale: 2, null: false, comment: "SKU price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tool_users", force: :cascade do |t|
    t.string "name", null: false, comment: "Name of the tool user"
    t.string "email", null: false, comment: "Email of the tool user"
    t.string "password_digest", null: false, comment: "Password digest for authentication"
    t.string "profile_picture_url", comment: "Cloudinary URL for profile image"
    t.string "role", comment: "User role (e.g., admin, staff)"
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

  create_table "wholesalers", force: :cascade do |t|
    t.string "name", null: false, comment: "Name of the wholesaler"
    t.string "contact_info", comment: "Contact information"
    t.string "address", comment: "Address of the wholesaler"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "advertising_costs", "orders"
  add_foreign_key "buyers", "addresses"
  add_foreign_key "inventories", "products"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "skus"
  add_foreign_key "order_status_histories", "orders"
  add_foreign_key "payment_fees", "orders"
  add_foreign_key "procurements", "orders"
  add_foreign_key "product_categories", "product_categories", column: "parent_category_id"
  add_foreign_key "products", "product_categories", column: "product_categories_id"
  add_foreign_key "quotation_item_changes", "quotation_items"
  add_foreign_key "quotation_items", "products"
  add_foreign_key "quotation_items", "quotations"
  add_foreign_key "quotations", "wholesalers"
  add_foreign_key "remarks", "orders"
  add_foreign_key "sales", "orders"
  add_foreign_key "sales_channel_fees", "sales_channels"
  add_foreign_key "sales_channels", "orders"
  add_foreign_key "shipments", "orders"
  add_foreign_key "sku_part_number_links", "products"
  add_foreign_key "sku_part_number_links", "skus"
end
