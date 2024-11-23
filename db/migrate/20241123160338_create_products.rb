class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :oem_part_number, null: false, comment: "OEM part number"
      t.boolean :is_oem, null: false, comment: "Indicates if it is an OEM part"
      t.string :domestic_title, comment: "Domestic title"
      t.string :international_title, comment: "International title"
      t.references :product_categories, foreign_key: true, comment: "Foreign key to product categories"
      t.string :product_status, comment: "Product status"
      t.timestamps
    end
  end
end
