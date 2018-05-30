json.message do
  json.from @message.user
  json.to @message.inbox.user
  json.item @message.item
  json.content @message.content
end
