class AddColumnToOrderStock < ActiveRecord::Migration[5.2]
  def change
    add_column :order_stocks, :order_date, :date
  end
end
