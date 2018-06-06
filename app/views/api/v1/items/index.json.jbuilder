json.items do
  json.array! @items do |item|
    json.id item.id
    json.user_id item.user_id
    json.title item.title
    json.condition item.condition
    json.cover_image item.cover_image
    json.description item.description
    json.city item.city
    json.tag_list item.tag_list
    json.price item.price
    json.must_pick_up item.must_pick_up
    json.updated_at item.updated_at
  end
end

json.last_page do
  json.last_page @last_page
end

