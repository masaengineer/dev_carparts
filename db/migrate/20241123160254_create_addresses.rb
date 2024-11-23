class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_primary, null: false, comment: "Primary part of the address"
      t.string :address_secondary, comment: "Additional address information (optional)"
      t.string :city, null: false
      t.string :state_province, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.string :address_formats, comment: "Formats of the address"

      t.timestamps
    end
  end
end
