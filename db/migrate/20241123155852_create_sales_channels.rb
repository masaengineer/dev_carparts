class CreateSalesChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_channels do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.string :channel_name, null: false, comment: "Name of the sales channel"
      t.string :export_domestic_flag, comment: "Flag for domestic export"

      t.timestamps
    end
  end
end
