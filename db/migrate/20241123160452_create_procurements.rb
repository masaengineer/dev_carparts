class CreateProcurements < ActiveRecord::Migration[7.0]
  def change
    create_table :procurements do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.decimal :purchase_price, precision: 10, scale: 2, comment: "Purchase price"
      t.decimal :domestic_transfer_fee, precision: 10, scale: 2, comment: "Domestic transfer fee"
      t.decimal :forwarding_fee, precision: 10, scale: 2, comment: "Forwarding fee"
      t.decimal :photo_fee, precision: 10, scale: 2, comment: "Photo fee"

      t.timestamps
    end
  end
end
