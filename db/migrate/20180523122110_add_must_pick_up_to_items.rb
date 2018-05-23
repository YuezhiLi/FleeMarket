class AddMustPickUpToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :must_pick_up, :boolean
  end
end
