# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# ユーザーのシードデータ
User.create([
  { email: 'admin@example.com', password: 'password', role: 'admin', name: 'Admin User' },
  { email: 'staff@example.com', password: 'password', role: 'staff', name: 'Staff User' }
])

# 住所のシードデータ
Address.create([
  { address_primary: '123 Main St', address_secondary: 'Apt 1', city: 'Tokyo', state_province: 'Tokyo', postal_code: '100-0001', country: 'Japan', address_formats: 'JP' },
  { address_primary: '456 Elm St', address_secondary: nil, city: 'Osaka', state_province: 'Osaka', postal_code: '530-0001', country: 'Japan', address_formats: 'JP' }
])

# バイヤーのシードデータ
Buyer.create([
  { name: 'John Doe', address_id: 1, email: 'john@example.com' },
  { name: 'Jane Smith', address_id: 2, email: 'jane@example.com' }
])

# 商品カテゴリのシードデータ
ProductCategory.create([
  { category_name: 'Electronics', description: 'Electronic items', parent_category_id: nil },
  { category_name: 'Home Appliances', description: 'Appliances for home use', parent_category_id: nil }
])

# 商品のシードデータ
Product.create([
  { oem_part_number: 'OEM123', is_oem: true, domestic_title: '国内商品', international_title: 'International Product', product_categories_id: 1, product_status: 'available' },
  { oem_part_number: 'OEM456', is_oem: false, domestic_title: '輸入商品', international_title: 'Imported Product', product_categories_id: 2, product_status: 'available' }
])

# SKUのシードデータ
Sku.create([
  { code: 'SKU001', price: 100.00 },
  { code: 'SKU002', price: 200.00 }
])

# 在庫のシードデータ
Inventory.create([
  { product_id: 1, quantity: 50, stock_order_date: Date.today, stock_type: 'own' },
  { product_id: 2, quantity: 30, stock_order_date: Date.today, stock_type: 'manufacturer' }
])

# 注文のシードデータ
Order.create([
  { order_number: 'ORD001', sale_date: Date.today, channel_id: 1, tool_user_id: 1, buyer_id: 1, order_status: 'confirmed' },
  { order_number: 'ORD002', sale_date: Date.today, channel_id: 1, tool_user_id: 2, buyer_id: 2, order_status: 'pending' }
])

# 注文アイテムのシードデータ
OrderItem.create([
  { order_id: 1, sku_id: 1, quantity: 2, price: 100.00 },
  { order_id: 2, sku_id: 2, quantity: 1, price: 200.00 }
])

# 広告費のシードデータ
AdvertisingCost.create([
  { order_id: 1, product_ad_cost: 50.00 },
  { order_id: 2, product_ad_cost: 75.00 }
])

# 支払い手数料のシードデータ
PaymentFee.create([
  { order_id: 1, fee_type: 'credit_card', fee_rate: 0.03, option: 1 },
  { order_id: 2, fee_type: 'paypal', fee_rate: 0.02, option: 2 }
])

# 仕入れのシードデータ
Procurement.create([
  { order_id: 1, purchase_price: 90.00, domestic_transfer_fee: 5.00, forwarding_fee: 10.00, photo_fee: 2.00 },
  { order_id: 2, purchase_price: 180.00, domestic_transfer_fee: 7.00, forwarding_fee: 12.00, photo_fee: 3.00 }
])

# 出荷のシードデータ
Shipment.create([
  { order_id: 1, carrier: 'FedEx', shipping_method: 'Express', weight: 1.5, length: 10.0, width: 5.0, height: 5.0, destination_country: 'Japan', tracking_number: 'TRACK123', customer_domestic_shipping: 500.0, customer_international_shipping: 1000.0 },
  { order_id: 2, carrier: 'DHL', shipping_method: 'Standard', weight: 2.0, length: 15.0, width: 10.0, height: 10.0, destination_country: 'Japan', tracking_number: 'TRACK456', customer_domestic_shipping: 600.0, customer_international_shipping: 1200.0 }
])

# 売上のシードデータ
Sale.create([
  { order_id: 1, price_original: 200.00, currency_code: 'JPY', conversion_rate: 1.0, price_jpy: 200.00, conversion_date: Date.today },
  { order_id: 2, price_original: 400.00, currency_code: 'JPY', conversion_rate: 1.0, price_jpy: 400.00, conversion_date: Date.today }
])

# 売上チャネル手数料のシードデータ
SalesChannelFee.create([
  { sales_channel_id: 1, fee_rate: 0.05 },
  { sales_channel_id: 2, fee_rate: 0.04 }
])

# 注文ステータス履歴のシードデータ
OrderStatusHistory.create([
  { order_id: 1, order_status: 'confirmed', status_change_date: DateTime.now, changed_by: 'admin' },
  { order_id: 2, order_status: 'pending', status_change_date: DateTime.now, changed_by: 'staff' }
])

# 見積もりのシードデータ
Quotation.create([
  { wholesaler_id: 1, quotation_date: Date.today, status: 'pending', estimated_delivery: Date.today + 7, wholesaler_remarks: 'First quote', notes: 'Urgent request' },
  { wholesaler_id: 2, quotation_date: Date.today, status: 'approved', estimated_delivery: Date.today + 14, wholesaler_remarks: 'Second quote', notes: 'Standard request' }
])

# 見積もりアイテムのシードデータ
QuotationItem.create([
  { quotation_id: 1, product_id: 1, quantity: 10, estimated_price: 1000.00 },
  { quotation_id: 2, product_id: 2, quantity: 5, estimated_price: 2000.00 }
])

# 見積もりアイテム変更のシードデータ
QuotationItemChange.create([
  { quotation_item_id: 1, original_part_number: 'OEM123', new_part_number: 'OEM124', change_date: DateTime.now, change_reason: 'Updated part number' },
  { quotation_item_id: 2, original_part_number: 'OEM456', new_part_number: 'OEM457', change_date: DateTime.now, change_reason: 'Updated part number' }
])

# 備考のシードデータ
Remark.create([
  { order_id: 1, partner_note: 'Important client', internal_note: 'Handle with care' },
  { order_id: 2, partner_note: 'Regular client', internal_note: 'Standard handling' }
])

# 卸売業者のシードデータ
Wholesaler.create([
  { name: 'Wholesaler A', contact_info: 'contact@wholesalera.com', address: '123 Wholesale St' },
  { name: 'Wholesaler B', contact_info: 'contact@wholesalerb.com', address: '456 Wholesale Ave' }
])

# ツールユーザーのシードデータ
ToolUser.create([
  { name: 'Tool User 1', email: 'tooluser1@example.com', password_digest: 'password' },
  { name: 'Tool User 2', email: 'tooluser2@example.com', password_digest: 'password' }
])
