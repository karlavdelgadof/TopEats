# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do |i|
  Address.create!(description: "Address #{i}")
end

10.times do |i|
  Customer.create!(full_name: "Person #{i}", email: "email.person#{i}@example.com", phone_number: "(143)-977-2346", address_id: rand(1..20))
end

10.times do |i|
  Courier.create!(full_name: "Person #{i}", email: "email.person#{i}@example.com", phone_number: "(243)-987-2347", address_id: rand(1..20))
end

10.times do
  Vehicle.create!(courier_id: rand(1..10), vehicle_type: rand(0..2))
end

20.times do
  Order.create!(status: rand(0..3), courier_id: rand(11..20), customer_id: rand(1..10), total_price: rand(5..9999))
end


10.times do |i|
  MenuItem.create!(name: "Item #{i}")
end

30.times do
  OrderItem.create!(order_id: rand(1..20), menu_item_id: rand(1..10))
end

