json.items do
  json.array! @items do |item|
    json.id item.id
    json.title item.title
    json.condition item.condition
    json.cover_image item.cover_image
    json.description item.description
    json.city item.city
    json.tag_list item.tag_list
    json.price item.price
    json.must_pick_up item.must_pick_up
  end
end
