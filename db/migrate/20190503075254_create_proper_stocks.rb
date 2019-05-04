class CreateProperStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :proper_stocks do |t|
      t.references :shop, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :date_type
      t.integer :quantity

      t.timestamps
    end
  end
end
