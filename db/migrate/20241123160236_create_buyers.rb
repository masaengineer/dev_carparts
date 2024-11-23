class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string :name, null: false, comment: "Name of the buyer"
      t.references :address, foreign_key: true, comment: "Foreign key to addresses"
      t.string :email, comment: "Email of the buyer"

      t.index :name
      t.timestamps
    end
  end
end
