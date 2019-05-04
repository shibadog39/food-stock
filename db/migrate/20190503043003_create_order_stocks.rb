class CreateOrderStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :order_stocks do |t|
      t.references :shop, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
