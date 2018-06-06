class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.text :cause

      t.timestamps
    end
  end
end
