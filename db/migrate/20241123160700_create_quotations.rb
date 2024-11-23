class CreateQuotations < ActiveRecord::Migration[7.0]
  def change
    create_table :quotations do |t|
      t.references :wholesaler, null: false, foreign_key: true, comment: "Foreign key to wholesalers"
      t.date :quotation_date, null: false, comment: "Date of the quotation"
      t.string :status, comment: "Quotation status"
      t.date :estimated_delivery, comment: "Estimated delivery date"
      t.text :wholesaler_remarks, comment: "Remarks from wholesaler"
      t.text :notes, comment: "Additional notes"

      t.timestamps
    end
  end
end
