json.conversations do
  json.array! @conversations do |c|
    json.item c[:item]
    json.interlocutor c[:interlocutor]
    json.last_message c[:last_message]
    json.created_at c[:created_at]
  end
end
