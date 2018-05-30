class AddItemIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :item, foreign_key: true
  end
end
