class Sku < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :sku_part_number_links
  has_many :products, through: :sku_part_number_links
end
