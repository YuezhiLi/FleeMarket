class RenameConnectionsToFavorites < ActiveRecord::Migration[5.1]
  def change
    rename :connections, :favorites
  end
end
