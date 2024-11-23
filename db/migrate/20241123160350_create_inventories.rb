class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :product, null: false, foreign_key: true, comment: "Foreign key to products"
      t.integer :quantity, null: false, comment: "Quantity in inventory"
      t.date :stock_order_date, comment: "Date of stock order"
      t.string :stock_type, comment: "Type of inventory (e.g., own, manufacturer, wholesaler)"

      t.timestamps
    end
  end
end
