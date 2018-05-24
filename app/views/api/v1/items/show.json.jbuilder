  json.item do
    json.id @item.id
    json.title @item.title
    json.condition @item.condition
    json.cover_image @item.cover_image
    json.description @item.description
    json.city @item.city
    json.price @item.price
    json.tag_list @item.tag_list
    json.must_pick_up @item.must_pick_up
  end

 json.related_items do
  json.array! @related_items do |item|
    json.id item.id
    json.title item.title
  end
end
