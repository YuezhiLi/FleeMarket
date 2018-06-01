json.message do
  json.created_at @message.created_at.strftime("%A, %d %b %Y %l:%M %p")
  json.sender @message.user
  json.content @message.content
end
