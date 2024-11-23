class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.decimal :price_original, precision: 10, scale: 2, comment: "Original price"
      t.string :currency_code, comment: "Currency code"
      t.decimal :conversion_rate, precision: 10, scale: 6, comment: "Conversion rate"
      t.decimal :price_jpy, precision: 10, scale: 2, comment: "Price in JPY"
      t.date :conversion_date, comment: "Currency conversion date"

      t.timestamps
    end
  end
end
