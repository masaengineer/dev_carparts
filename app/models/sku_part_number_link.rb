class SkuPartNumberLink < ApplicationRecord
  belongs_to :sku
  belongs_to :product
end
