json.profile do
  json.id @user.id
  json.openId @user.open_id
  json.nickName @user.nickName
  json.city @user.city
  json.email @user.email
  json.phoneNumber @user.phone_number
  json.avatarUrl @user.avatarUrl
  json.authorizationToken @user.authorization_token
end
