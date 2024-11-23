class CreatePaymentFees < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_fees do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.string :fee_type, comment: "Type of fee"
      t.decimal :fee_rate, precision: 5, scale: 4, comment: "Fee rate (e.g., 0.03 for 3%)"
      t.integer :option, comment: "Fee option"

      t.timestamps
    end
  end
end
