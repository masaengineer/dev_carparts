class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :category_name, null: false, comment: "Name of the category"
      t.string :description, comment: "Description of the category"
      t.references :parent_category, foreign_key: { to_table: :product_categories }, comment: "Self-referencing for subcategories"

      t.timestamps
    end
  end
end
