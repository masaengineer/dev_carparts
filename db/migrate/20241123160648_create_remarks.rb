class CreateRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :remarks do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.string :partner_note, comment: "Note for the partner"
      t.string :internal_note, comment: "Internal note"

      t.timestamps
    end
  end
end
