class CreateAdvertisingCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :advertising_costs do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.decimal :product_ad_cost, precision: 10, scale: 2, comment: "Advertising cost for the product"

      t.timestamps
    end
  end
end
