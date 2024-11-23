class CreateSkus < ActiveRecord::Migration[7.0]
  def change
    create_table :skus do |t|
      t.string :name, null: false, comment: "SKU name"
      t.decimal :price, precision: 10, scale: 2, null: false, comment: "SKU price"
      t.timestamps
    end
  end
end
