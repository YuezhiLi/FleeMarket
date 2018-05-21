class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :condition
      t.string :cover_image
      t.string :description
      t.string :city

      t.timestamps
    end
  end
end
