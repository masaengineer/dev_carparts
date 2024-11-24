class Order < ApplicationRecord
  has_many :order_items
  has_many :skus, through: :order_items
  has_one :sales_channel
  has_one :procurement
  has_one :sale
end
