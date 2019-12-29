class ChangeColumnToProperStock < ActiveRecord::Migration[5.2]
  def change
    change_column :proper_stocks, :quantity, :integer, default: 0
  end
end
