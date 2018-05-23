json.items do
  json.array! @items do |item|
    json.id item.id
    json.title item.title
    json.condition item.condition
    json.cover_image item.cover_image
    json.description item.description
    json.city item.city
  end
end
