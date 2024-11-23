class CreateOrderStatusHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :order_status_histories do |t|
      t.references :order, null: false, foreign_key: true, comment: "Foreign key to orders"
      t.string :order_status, null: false, comment: "Current status of the order"
      t.datetime :status_change_date, null: false, comment: "Date when the status was changed"
      t.string :changed_by, comment: "User who changed the status"

      t.timestamps
    end
  end
end
