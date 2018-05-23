class ChangePhoneNumberInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :phone_number, :phoneNumber
  end
end
