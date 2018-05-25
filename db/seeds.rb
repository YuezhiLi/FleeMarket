# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.all
Item.destroy_all
users.each do |u|
  puts "creating 2 items for #{u.nickName}..."
  tags = ["kitchen", "wood", "glassware", "bedding", "clothing", "modern", "vintage", "minimalism", "furniture"]
  3.times do
    Item.create(
      user_id: u.id,
      title: Faker::HitchhikersGuideToTheGalaxy.starship,
      condition: ["brandnew", "like new", "somewhat used", "used", "very used"].sample,
      description: Faker::HitchhikersGuideToTheGalaxy.quote,
      city: u.city,
      price: (1..100).to_a.sample,
      must_pick_up: [true, false].sample,
      cover_image: "https://picsum.photos/400/400?image=#{(1..25).to_a.sample}",
      tag_list: tags.sample(3)
      )
  end
  puts "3 items created for #{u.nickName}!"
end
