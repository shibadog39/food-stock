class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :shop, null: false
      t.references :supplier, null: false
      t.string :name, null: false, limit: 255
      t.integer :category, null: false, default: 0
      t.integer :lead_time
      t.integer :price
      t.text :memo

      t.timestamps
    end
  end
end
