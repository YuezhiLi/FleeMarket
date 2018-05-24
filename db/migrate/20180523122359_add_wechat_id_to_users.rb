class AddWechatIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wechat_id, :string
  end
end
