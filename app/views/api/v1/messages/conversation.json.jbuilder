json.messages do
  json.array! @messages do |m|
    json.created_at m.created_at.strftime("%A, %d %b %Y %l:%M %p")
    json.content m.content
    json.sender m.user
  end
end
json.interlocutor do
  json.id @interlocutor.id
end
json.item do
  json.id @item.id
  json.title @item.title
  json.owner_id @item.user.id
  json.owner @item.user.nickName
  json.price @item.price
  json.owner_avatar @item.user.avatarUrl
  json.cover_image @item.cover_image
end
