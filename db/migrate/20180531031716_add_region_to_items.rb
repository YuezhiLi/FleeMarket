class AddRegionToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :region, :string
  end
end
