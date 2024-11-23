class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number, null: false, comment: "Unique order identifier"
      t.date :sale_date, comment: "Date the order is confirmed"
      t.integer :channel_id, foreign_key: true, comment: "Foreign key to channel"
      t.integer :tool_user_id, foreign_key: true, comment: "Foreign key to tool user"
      t.integer :buyer_id, foreign_key: true, comment: "Foreign key to buyer"
      t.string :order_status, comment: "Order status"
      t.timestamps
    end

    add_index :orders, :order_number, unique: true, name: 'index_orders_on_order_number'
  end
end
