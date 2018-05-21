class ChangePhoneNumberToStringInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :phone_number, :string
  end
end
