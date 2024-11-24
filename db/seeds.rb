# ユーザーのシードデータ
users = [
  { email: 'masahiro.track.a.f@gmail.com', password: 'test123', role: 'admin', name: 'Masahiro Fujii' },
  { email: 'admin@example.com', password: 'password', role: 'admin', name: 'Admin User' },
  { email: 'staff@example.com', password: 'password', role: 'staff', name: 'Staff User' }
]

users.each do |user|
  User.find_or_create_by(email: user[:email]) do |u|
    u.password = user[:password]
    u.role = user[:role]
    u.name = user[:name]
  end
end

# 住所のシードデータ
addresses = [
  { address_primary: '123 Main St', address_secondary: 'Apt 1', city: 'Tokyo', state_province: 'Tokyo', postal_code: '100-0001', country: 'Japan', address_formats: 'JP' },
  { address_primary: '456 Elm St', address_secondary: nil, city: 'Osaka', state_province: 'Osaka', postal_code: '530-0001', country: 'Japan', address_formats: 'JP' }
]

addresses.each do |address|
  Address.find_or_create_by(address_primary: address[:address_primary]) do |a|
    a.address_secondary = address[:address_secondary]
    a.city = address[:city]
    a.state_province = address[:state_province]
    a.postal_code = address[:postal_code]
    a.country = address[:country]
    a.address_formats = address[:address_formats]
  end
end

# バイヤーのシードデータ
buyers = [
  { name: 'John Doe', address_id: Address.find_by(address_primary: '123 Main St').id, email: 'john@example.com' },
  { name: 'Jane Smith', address_id: Address.find_by(address_primary: '456 Elm St').id, email: 'jane@example.com' }
]

buyers.each do |buyer|
  Buyer.find_or_create_by(email: buyer[:email]) do |b|
    b.name = buyer[:name]
    b.address_id = buyer[:address_id]
  end
end

# 注文のシードデータ
orders = [
  { order_number: 'ORD001', sale_date: Date.today, channel_id: 1, tool_user_id: 1, buyer_id: Buyer.find_by(email: 'john@example.com').id, order_status: 'confirmed' },
  { order_number: 'ORD002', sale_date: Date.today, channel_id: 1, tool_user_id: 2, buyer_id: Buyer.find_by(email: 'jane@example.com').id, order_status: 'pending' }
]

orders.each do |order|
  Order.find_or_create_by(order_number: order[:order_number]) do |o|
    o.sale_date = order[:sale_date]
    o.channel_id = order[:channel_id]
    o.tool_user_id = order[:tool_user_id]
    o.buyer_id = order[:buyer_id]
    o.order_status = order[:order_status]
  end
end

# SKUのシードデータ
skus = [
  { code: 'SKU001', price: 100.00 },
  { code: 'SKU002', price: 200.00 }
]

skus.each do |sku|
  Sku.find_or_create_by(code: sku[:code]) do |s|
    s.price = sku[:price]
  end
end

# 注文アイテムのシードデータ
order_items = [
  { order_id: Order.find_by(order_number: 'ORD001').id, sku_id: Sku.find_by(code: 'SKU001').id, quantity: 2, price: 100.00 },
  { order_id: Order.find_by(order_number: 'ORD002').id, sku_id: Sku.find_by(code: 'SKU002').id, quantity: 1, price: 200.00 }
]

order_items.each do |item|
  OrderItem.find_or_create_by(order_id: item[:order_id], sku_id: item[:sku_id]) do |oi|
    oi.quantity = item[:quantity]
    oi.price = item[:price]
  end
end

# 販売チャネルのシードデータ
sales_channels = [
  { order_id: Order.find_by(order_number: 'ORD001').id, channel_name: 'Online Store', export_domestic_flag: 'domestic' },
  { order_id: Order.find_by(order_number: 'ORD002').id, channel_name: 'Marketplace', export_domestic_flag: 'export' }
]

sales_channels.each do |channel|
  SalesChannel.find_or_create_by(order_id: channel[:order_id]) do |sc|
    sc.channel_name = channel[:channel_name]
    sc.export_domestic_flag = channel[:export_domestic_flag]
  end
end

# 販売チャネル手数料のシードデータ
sales_channel_fees = [
  { sales_channel_id: SalesChannel.find_by(channel_name: 'Online Store').id, fee_rate: 0.05 },
  { sales_channel_id: SalesChannel.find_by(channel_name: 'Marketplace').id, fee_rate: 0.04 }
]

sales_channel_fees.each do |fee|
  SalesChannelFee.find_or_create_by(sales_channel_id: fee[:sales_channel_id]) do |scf|
    scf.fee_rate = fee[:fee_rate]
  end
end

# 広告費のシードデータ
advertising_costs = [
  { order_id: Order.find_by(order_number: 'ORD001').id, product_ad_cost: 50.00 },
  { order_id: Order.find_by(order_number: 'ORD002').id, product_ad_cost: 75.00 }
]

advertising_costs.each do |cost|
  AdvertisingCost.find_or_create_by(order_id: cost[:order_id]) do |ac|
    ac.product_ad_cost = cost[:product_ad_cost]
  end
end

# 仕入れのシードデータ
procurements = [
  { order_id: Order.find_by(order_number: 'ORD001').id, purchase_price: 90.00, domestic_transfer_fee: 5.00, forwarding_fee: 10.00, photo_fee: 2.00 },
  { order_id: Order.find_by(order_number: 'ORD002').id, purchase_price: 180.00, domestic_transfer_fee: 7.00, forwarding_fee: 12.00, photo_fee: 3.00 }
]

procurements.each do |procurement|
  Procurement.find_or_create_by(order_id: procurement[:order_id]) do |p|
    p.purchase_price = procurement[:purchase_price]
    p.domestic_transfer_fee = procurement[:domestic_transfer_fee]
    p.forwarding_fee = procurement[:forwarding_fee]
    p.photo_fee = procurement[:photo_fee]
  end
end

# 商品カテゴリのシードデータ
product_categories = [
  { category_name: 'Category A', description: 'Description for Category A', parent_category_id: nil },
  { category_name: 'Category B', description: 'Description for Category B', parent_category_id: nil }
]

product_categories.each do |category|
  ProductCategory.find_or_create_by(category_name: category[:category_name]) do |pc|
    pc.description = category[:description]
    pc.parent_category_id = category[:parent_category_id]
  end
end

# 商品のシードデータ
products = [
  { oem_part_number: 'OEM001', is_oem: true, domestic_title: '商品A', international_title: 'Product A', product_categories_id: ProductCategory.find_by(category_name: 'Category A').id, product_status: 'available' },
  { oem_part_number: 'OEM002', is_oem: false, domestic_title: '商品B', international_title: 'Product B', product_categories_id: ProductCategory.find_by(category_name: 'Category B').id, product_status: 'available' }
]

products.each do |product|
  Product.find_or_create_by(oem_part_number: product[:oem_part_number]) do |p|
    p.is_oem = product[:is_oem]
    p.domestic_title = product[:domestic_title]
    p.international_title = product[:international_title]
    p.product_categories_id = product[:product_categories_id]
    p.product_status = product[:product_status]
  end
end

# 在庫のシードデータ
inventories = [
  { product_id: Product.find_by(oem_part_number: 'OEM001').id, quantity: 100, stock_order_date: Date.today, stock_type: 'own' },
  { product_id: Product.find_by(oem_part_number: 'OEM002').id, quantity: 50, stock_order_date: Date.today, stock_type: 'wholesaler' }
]

inventories.each do |inventory|
  Inventory.find_or_create_by(product_id: inventory[:product_id]) do |i|
    i.quantity = inventory[:quantity]
    i.stock_order_date = inventory[:stock_order_date]
    i.stock_type = inventory[:stock_type]
  end
end

# 出荷のシードデータ
shipments = [
  { order_id: Order.find_by(order_number: 'ORD001').id, carrier: 'Carrier A', shipping_method: 'Express', weight: 1.5, length: 10.0, width: 5.0, height: 5.0, destination_country: 'Japan', tracking_number: 'TRACK001', customer_domestic_shipping: 500.0, customer_international_shipping: 1000.0 },
  { order_id: Order.find_by(order_number: 'ORD002').id, carrier: 'Carrier B', shipping_method: 'Standard', weight: 2.0, length: 15.0, width: 10.0, height: 10.0, destination_country: 'Japan', tracking_number: 'TRACK002', customer_domestic_shipping: 300.0, customer_international_shipping: 800.0 }
]

shipments.each do |shipment|
  Shipment.find_or_create_by(order_id: shipment[:order_id]) do |s|
    s.carrier = shipment[:carrier]
    s.shipping_method = shipment[:shipping_method]
    s.weight = shipment[:weight]
    s.length = shipment[:length]
    s.width = shipment[:width]
    s.height = shipment[:height]
    s.destination_country = shipment[:destination_country]
    s.tracking_number = shipment[:tracking_number]
    s.customer_domestic_shipping = shipment[:customer_domestic_shipping]
    s.customer_international_shipping = shipment[:customer_international_shipping]
  end
end

# 売上のシードデータ
sales = [
  { order_id: Order.find_by(order_number: 'ORD001').id, price_original: 100.00, currency_code: 'JPY', conversion_rate: 1.0, price_jpy: 100.00, conversion_date: Date.today },
  { order_id: Order.find_by(order_number: 'ORD002').id, price_original: 200.00, currency_code: 'JPY', conversion_rate: 1.0, price_jpy: 200.00, conversion_date: Date.today }
]

sales.each do |sale|
  Sale.find_or_create_by(order_id: sale[:order_id]) do |s|
    s.price_original = sale[:price_original]
    s.currency_code = sale[:currency_code]
    s.conversion_rate = sale[:conversion_rate]
    s.price_jpy = sale[:price_jpy]
    s.conversion_date = sale[:conversion_date]
  end
end

# 仕入れのシードデータ
remarks = [
  { order_id: Order.find_by(order_number: 'ORD001').id, partner_note: 'Partner note for order 1', internal_note: 'Internal note for order 1' },
  { order_id: Order.find_by(order_number: 'ORD002').id, partner_note: 'Partner note for order 2', internal_note: 'Internal note for order 2' }
]

remarks.each do |remark|
  Remark.find_or_create_by(order_id: remark[:order_id]) do |r|
    r.partner_note = remark[:partner_note]
    r.internal_note = remark[:internal_note]
  end
end

# Wholesalerのシードデータ
wholesalers = [
  { name: 'Wholesaler A', contact_info: 'contact@wholesalera.com', address: '123 Wholesale St, Tokyo, Japan' },
  { name: 'Wholesaler B', contact_info: 'contact@wholesalerb.com', address: '456 Wholesale Ave, Osaka, Japan' }
]

wholesalers.each do |wholesaler|
  Wholesaler.find_or_create_by(name: wholesaler[:name]) do |w|
    w.contact_info = wholesaler[:contact_info]
    w.address = wholesaler[:address]
  end
end

# クオテーションのシードデータ
quotations = [
  { wholesaler_id: Wholesaler.find_by(name: 'Wholesaler A').id, quotation_date: Date.today, status: 'pending', estimated_delivery: Date.today + 7, wholesaler_remarks: 'Remarks from wholesaler', notes: 'Additional notes' }
]

quotations.each do |quotation|
  Quotation.find_or_create_by(wholesaler_id: quotation[:wholesaler_id]) do |q|
    q.quotation_date = quotation[:quotation_date]
    q.status = quotation[:status]
    q.estimated_delivery = quotation[:estimated_delivery]
    q.wholesaler_remarks = quotation[:wholesaler_remarks]
    q.notes = quotation[:notes]
  end
end

# クオテーションアイテムのシードデータ
quotation_items = [
  { quotation_id: Quotation.first.id, product_id: Product.find_by(oem_part_number: 'OEM001').id, quantity: 10, estimated_price: 100.00 }
]

quotation_items.each do |item|
  QuotationItem.find_or_create_by(quotation_id: item[:quotation_id], product_id: item[:product_id]) do |qi|
    qi.quantity = item[:quantity]
    qi.estimated_price = item[:estimated_price]
  end
end
