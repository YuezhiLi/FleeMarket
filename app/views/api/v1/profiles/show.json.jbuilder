json.profile do
  json.id @user.id
  json.openId @user.open_id
  json.nickName @user.nickName
  json.city @user.city
  json.avatarUrl @user.avatarUrl
  json.authorizationToken @user.authorization_token
  json.my_items @user.items
end

json.active_items do
  json.array! @active_items do |i|
    json.id i.id
    json.cover_image i.cover_image
    json.title i.title
    json.price i.price
  end
end

json.expired_items do
  json.array! @expired_items do |i|
    json.id i.id
    json.cover_image i.cover_image
    json.title i.title
    json.price i.price
  end
end
