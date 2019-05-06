class AddSequenceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sequence, :int, null: false, default: 0, after: :memo
  end
end
