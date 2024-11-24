class Product < ApplicationRecord
  has_many :sku_part_number_links
  has_many :skus, through: :sku_part_number_links
end
