class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.string :carrier, comment: "Shipping carrier"
      t.string :shipping_method, comment: "Method of shipping"
      t.float :weight, comment: "Weight of the shipment"
      t.float :length, comment: "Length of the shipment"
      t.float :width, comment: "Width of the shipment"
      t.float :height, comment: "Height of the shipment"
      t.string :destination_country, comment: "Destination country"
      t.string :tracking_number, comment: "Tracking number"
      t.float :customer_domestic_shipping, comment: "Domestic shipping cost"
      t.float :customer_international_shipping, comment: "International shipping cost"

      t.timestamps
    end
  end
end
