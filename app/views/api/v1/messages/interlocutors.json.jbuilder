json.interlocutors do
  json.array! @interlocutors do |i|
    json.id i.id
    json.nickName i.nickName
    json.avatarUrl i.avatarUrl
    json.city i.city
  end
end
