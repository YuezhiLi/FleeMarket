json.conversations do
  json.array! @conversations do |c|
    json.item c[:item]
    json.interlocutor c[:interlocutor]
  end
end
