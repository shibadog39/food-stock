class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.references :shop, null: false
      t.string :name, null: false, limit: 255
      t.string :tel
      t.string :fax
      t.string :email
      t.integer :lead_time
      t.text :memo

      t.timestamps
    end
  end
end
