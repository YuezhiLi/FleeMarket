json.items do
  json.array! @items do |item|
    json.id item.id
    json.title item.title
    json.condition item.cover_url
    json.cover_image item.cover_image

  end
end
