json.profile do
  json.id @user.id
  json.openId @user.open_id
  json.nickName @user.nickName
  json.city @user.city
  json.avatarUrl @user.avatarUrl
  json.authorizationToken @user.authorization_token
  json.my_items @user.items
end
