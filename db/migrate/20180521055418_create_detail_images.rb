class CreateDetailImages < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_images do |t|
      t.references :item, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
