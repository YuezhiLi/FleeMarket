  json.item do
    json.id @item.id
    json.user_id @item.user_id
    json.title @item.title
    json.condition @item.condition
    json.cover_image @item.cover_image
    json.detail_images @item.detail_images
    json.description @item.description
    json.city @item.city
    json.price @item.price
    json.tag_list @item.tag_list
    json.must_pick_up @item.must_pick_up
    json.owner @item.user
    json.items_from_the_same_owner @item.user.items
    json.updated_at @item.updated_at
end

 json.related_items do
  json.array! @related_items do |item|
    json.id item.id
    json.title item.title
    json.price item.price
    json.cover_image item.cover_image
    json.updated_at item.updated_at
  end
end
