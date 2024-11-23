class CreateWholesalers < ActiveRecord::Migration[7.0]
  def change
    create_table :wholesalers do |t|
      t.string :name, null: false, comment: "Name of the wholesaler"
      t.string :contact_info, comment: "Contact information"
      t.string :address, comment: "Address of the wholesaler"

      t.timestamps
    end
  end
end
