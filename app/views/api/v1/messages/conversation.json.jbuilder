json.messages do
  json.array! @messages do |m|
    json.created_at m.created_at
    json.content m.content
    json.sender m.user
  end
end
json.interlocutor do
  json.id @interlocutor.id
end
json.item do
  json.id @item.id
end
