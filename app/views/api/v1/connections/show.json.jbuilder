json.connection do
  json.item @connection.item
  json.owner @connection.item.user
  json.buyer @connection.user
end
