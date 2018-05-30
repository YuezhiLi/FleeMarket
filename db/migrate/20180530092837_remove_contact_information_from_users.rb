class RemoveContactInformationFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phoneNumber
    remove_column :users, :email
    remove_column :users, :wechat_id
    remove_column :users, :qr_code
  end
end
