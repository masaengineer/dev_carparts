# ユーザーのシードデータ
users = User.create([
  { email: 'admin@example.com', password: 'password', role: 'admin', name: 'Admin User' },
  { email: 'staff@example.com', password: 'password', role: 'staff', name: 'Staff User' }
])

# 住所のシードデータ
addresses = Address.create([
  { address_primary: '123 Main St', address_secondary: 'Apt 1', city: 'Tokyo', state_province: 'Tokyo', postal_code: '100-0001', country: 'Japan', address_formats: 'JP' },
  { address_primary: '456 Elm St', address_secondary: nil, city: 'Osaka', state_province: 'Osaka', postal_code: '530-0001', country: 'Japan', address_formats: 'JP' }
])

# バイヤーのシードデータ
buyers = Buyer.create([
  { name: 'John Doe', address_id: addresses.first.id, email: 'john@example.com' },
  { name: 'Jane Smith', address_id: addresses.second.id, email: 'jane@example.com' }
])

# 注文のシードデータ
orders = Order.create([
  { order_number: 'ORD001', sale_date: Date.today, channel_id: 1, tool_user_id: 1, buyer_id: buyers.first.id, order_status: 'confirmed' },
  { order_number: 'ORD002', sale_date: Date.today, channel_id: 1, tool_user_id: 2, buyer_id: buyers.second.id, order_status: 'pending' }
])

# SKUのシードデータ
skus = Sku.create([
  { code: 'SKU001', price: 100.00 },
  { code: 'SKU002', price: 200.00 }
])

# 注文アイテムのシードデータ
order_items = OrderItem.create([
  { order_id: orders.first.id, sku_id: skus.first.id, quantity: 2, price: 100.00 },
  { order_id: orders.second.id, sku_id: skus.second.id, quantity: 1, price: 200.00 }
])

# 販売チャネルのシードデータ
sales_channels = SalesChannel.create([
  { order_id: orders.first.id, channel_name: 'Online Store', export_domestic_flag: 'domestic' },
  { order_id: orders.second.id, channel_name: 'Marketplace', export_domestic_flag: 'export' }
])

# 販売チャネル手数料のシードデータ
sales_channel_fees = SalesChannelFee.create([
  { sales_channel_id: sales_channels.first.id, fee_rate: 0.05 },
  { sales_channel_id: sales_channels.second.id, fee_rate: 0.04 }
])

# 広告費のシードデータ
advertising_costs = AdvertisingCost.create([
  { order_id: orders.first.id, product_ad_cost: 50.00 },
  { order_id: orders.second.id, product_ad_cost: 75.00 }
])

# 仕入れのシードデータ
procurements = Procurement.create([
  { order_id: orders.first.id, purchase_price: 90.00, domestic_transfer_fee: 5.00, forwarding_fee: 10.00, photo_fee: 2.00 },
  { order_id: orders.second.id, purchase_price: 180.00, domestic_transfer_fee: 7.00, forwarding_fee: 12.00, photo_fee: 3.00 }
])

# 商品カテゴリのシードデータ
product_categories = ProductCategory.create([
  { category_name: 'Category A', description: 'Description for Category A', parent_category_id: nil },
  { category_name: 'Category B', description: 'Description for Category B', parent_category_id: nil }
])

# 商品のシードデータ# 商品カテゴリのシードデータ
product_categories = ProductCategory.create([
  { category_name: 'Category A', description: 'Description for Category A', parent_category_id: nil },
  { category_name: 'Category B', description: 'Description for Category B', parent_category_id: nil }
])

products = Product.create([
  { oem_part_number: 'OEM001', is_oem: true, domestic_title: '商品A', international_title: 'Product A', product_categories_id: 1, product_status: 'available' },
  { oem_part_number: 'OEM002', is_oem: false, domestic_title: '商品B', international_title: 'Product B', product_categories_id: 2, product_status: 'available' }
])

# 在庫のシードデータ
inventories = Inventory.create([
  { product_id: 1, quantity: 100, stock_order_date: Date.today, stock_type: 'own' },
  { product_id: 2, quantity: 50, stock_order_date: Date.today, stock_type: 'wholesaler' }
])

# 出荷のシードデータ
shipments = Shipment.create([
  { order_id: orders.first.id, carrier: 'Carrier A', shipping_method: 'Express', weight: 1.5, length: 10.0, width: 5.0, height: 5.0, destination_country: 'Japan', tracking_number: 'TRACK001', customer_domestic_shipping: 500.0, customer_international_shipping: 1000.0 },
  { order_id: orders.second.id, carrier: 'Carrier B', shipping_method: 'Standard', weight: 2.0, length: 15.0, width: 10.0, height: 10.0, destination_country: 'Japan', tracking_number: 'TRACK002', customer_domestic_shipping: 300.0, customer_international_shipping: 800.0 }
])

# 売上のシードデータ
sales = Sale.create([
  { order_id: orders.first.id, price_original: 100.00, currency_code: 'JPY', conversion_rate: 1.0, price_jpy: 100.00, conversion_date: Date.today },
  { order_id: orders.second.id, price_original: 200.00, currency_code: 'JPY', conversion_rate: 1.0, price_jpy: 200.00, conversion_date: Date.today }
])

# 仕入れのシードデータ
remarks = Remark.create([
  { order_id: orders.first.id, partner_note: 'Partner note for order 1', internal_note: 'Internal note for order 1' },
  { order_id: orders.second.id, partner_note: 'Partner note for order 2', internal_note: 'Internal note for order 2' }
])

# Wholesalerのシードデータ
wholesalers = Wholesaler.create([
  { name: 'Wholesaler A', contact_info: 'contact@wholesalera.com', address: '123 Wholesale St, Tokyo, Japan' },
  { name: 'Wholesaler B', contact_info: 'contact@wholesalerb.com', address: '456 Wholesale Ave, Osaka, Japan' }
])

# クオテーションのシードデータ
quotations = Quotation.create([
  { wholesaler_id: 1, quotation_date: Date.today, status: 'pending', estimated_delivery: Date.today + 7, wholesaler_remarks: 'Remarks from wholesaler', notes: 'Additional notes' }
])

# クオテーションアイテムのシードデータ
quotation_items = QuotationItem.create([
  { quotation_id: quotations.first.id, product_id: products.first.id, quantity: 10, estimated_price: 100.00 }
])
