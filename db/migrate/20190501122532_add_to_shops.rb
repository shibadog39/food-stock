class AddToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :name, :string
    add_column :shops, :address, :string
    add_column :shops, :tel, :string
    add_column :shops, :memo, :text
  end
end
