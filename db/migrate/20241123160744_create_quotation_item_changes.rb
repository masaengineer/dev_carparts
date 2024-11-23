class CreateQuotationItemChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :quotation_item_changes do |t|
      t.references :quotation_item, null: false, foreign_key: true, comment: "Foreign key to quotation items"
      t.string :original_part_number, comment: "Original part number"
      t.string :new_part_number, comment: "New part number"
      t.datetime :change_date, null: false, comment: "Date of the change"
      t.string :change_reason, comment: "Reason for the change"

      t.timestamps
    end
  end
end
