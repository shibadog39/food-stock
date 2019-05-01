class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false, limit: 255
      t.string :tel
      t.string :email
      t.string :address
      t.text :memo

      t.timestamps
    end
  end
end
