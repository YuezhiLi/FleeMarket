json.message do
  json.created_at @message.created_at
  json.sender @message.user
  json.content @message.content
end
