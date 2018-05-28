json.profile do
  json.id @user.id
  json.openId @user.open_id
  json.nickName @user.nickName
  json.city @user.city
  json.email @user.email
  json.wechatId @user.wechat_id
  json.QRCode @user.qr_code
  json.phoneNumber @user.phoneNumber
  json.avatarUrl @user.avatarUrl
  json.authorizationToken @user.authorization_token
  json.my_items @user.items
end
