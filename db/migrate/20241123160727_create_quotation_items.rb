class CreateQuotationItems < ActiveRecord::Migration[7.0]
  def change
    create_table :quotation_items do |t|
      t.references :quotation, null: false, foreign_key: true, comment: "Foreign key to quotations"
      t.references :product, null: false, foreign_key: true, comment: "Foreign key to products"
      t.integer :quantity, null: false, comment: "Quantity of the product"
      t.decimal :estimated_price, precision: 10, scale: 2, comment: "Estimated price of the product"

      t.timestamps
    end
  end
end
