class CreateActualStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :actual_stocks do |t|
      t.references :item, null: false
      t.integer :quantity
      t.date :counted_at, null: false
      t.timestamps

      t.index [:item_id, :counted_at], unique: true
    end
  end
end
