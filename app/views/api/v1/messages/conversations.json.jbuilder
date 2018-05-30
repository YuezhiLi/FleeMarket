json.selling_conversations do
  json.array! @selling_conversations do |c|
    json.item c[:item]
    json.interlocutor c[:interlocutor]
    json.last_message c[:last_message]
    json.created_at c[:created_at]
  end
end

json.buying_conversations do
  json.array! @buying_conversations do |c|
    json.item c[:item]
    json.interlocutor c[:interlocutor]
    json.last_message c[:last_message]
    json.created_at c[:created_at]
  end
end
