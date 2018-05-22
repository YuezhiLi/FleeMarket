json.profile do
  json.id @user.id
  json.nickName @user.nickName
  json.city @user.city
  json.email @user.email
  json.phone_number @user.phone_number
  json.avatarUrl @user.avatarUrl
end
