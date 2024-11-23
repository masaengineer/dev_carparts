class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :year, null: false, comment: "Year of the expense"
      t.integer :month, null: false, comment: "Month of the expense"
      t.string :item_name, null: false, comment: "Name of the expense item"
      t.decimal :amount, precision: 10, scale: 2, null: false, comment: "Amount of the expense"

      t.timestamps
    end
  end
end
