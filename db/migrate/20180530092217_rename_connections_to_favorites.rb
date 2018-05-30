class RenameConnectionsToFavorites < ActiveRecord::Migration[5.1]
  def change
    rename_table :connections, :favorites
  end
end
