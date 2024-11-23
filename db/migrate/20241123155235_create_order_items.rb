class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.references :sku, null: false, foreign_key: true, comment: "Foreign key to SKU"
      t.integer :quantity, null: false, comment: "Quantity of the item"
      t.decimal :price, precision: 10, scale: 2, null: false, comment: "Price of the item"

      t.timestamps
    end
  end
end
