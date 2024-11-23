class CreateSkuPartNumberLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :sku_part_number_links do |t|
      t.references :sku, null: false, foreign_key: true, comment: "Foreign key to SKUs"
      t.references :product, null: false, foreign_key: true, comment: "Foreign key to products"

      t.timestamps
    end
  end
end
