class CreateSalesChannelFees < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_channel_fees do |t|
      t.references :sales_channel, null: false, foreign_key: true, comment: "Foreign key to sales channels"
      t.decimal :fee_rate, precision: 5, scale: 4, comment: "Fee rate"

      t.timestamps
    end
  end
end
