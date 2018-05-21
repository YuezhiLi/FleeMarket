class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickName
      t.string :city
      t.string :email
      t.string :avatarUrl
      t.integer :phone_number

      t.timestamps
    end
  end
end
