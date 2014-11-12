# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Admin.create!(
  email: 'andrew@example.com',
  password: '12345678',
  password_confirmation: '12345678'  
)

@azurite = Product.create!(
  name: "Azurite",
  description: "Some gems have hidden qualities beyond their luster, beyond their shine... Azurite is one of those gems.",
  shine: 8,
  price: 110.50,
  rarity: 7,
  color: '#CCC',
  faces: 14
)
@bloodstone = Product.create!(
  name: "Bloodstone",
  description: "Origin of the Bloodstone is unknown, hence its low value. It has a very high shine and 12 sides, however.",
  shine: 9,
  price: 22.90,
  rarity: 6,
  color: '#EEE',
  faces: 12
)
@zircon = Product.create!(
  name: "Zircon",
  description: "Zircon is our most coveted and sought after gem. You will pay much to be the proud owner of this gorgeous and high shine gem.",
  shine: 70,
  price: 1100,
  rarity: 2,
  color: '#000',
  faces: 6
)

(1..3).each do |i|
  Image.create!(
    url: "images/gem-0#{i}.gif",
    product_id: @azurite.id
  )
end

(4..6).each do |i|
  Image.create!(
    url: "images/gem-0#{i}.gif",
    product_id: @bloodstone.id 
  )
end

(7..9).each do |i|
  Image.create!(
    url: "images/gem-0#{i}.gif",
    product_id: @zircon.id
  )
end