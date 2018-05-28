json.connection do
  json.id @connection.id
  json.item @connection.item
  json.owner @connection.item.user
  json.buyer @connection.user
end
