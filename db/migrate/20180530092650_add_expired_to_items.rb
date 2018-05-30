class AddExpiredToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :expired, :boolean, default: :false
  end
end
