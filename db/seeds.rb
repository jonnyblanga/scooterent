# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
User.destroy_all
Review.destroy_all
Scooter.destroy_all
Reservation.destroy_all

puts 'Creating fake User...'

i = 1
10.times do
  user = User.new(
    name: Faker::Name.first_name,
    birthday: Faker::Date.birthday(18, 65),
    address:Faker::Address.street_address,
    license_photo: "",
    email:Faker::Internet.email,
    encrypted_password: 123456
  )
  user.save
  i += 1
end

puts "Finished the User! #{User.all.count}"

# puts 'Creating faker Scooters...'
# url = "https://images.unsplash.com/photo-1495608312049-285ae516323d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"

# i = 1
# 30.times do
#   Scooter = Scooter.new(
#     name: Faker::Movie.quote
#   )
#   Scooter.remote_photo_url = url

#   next unless Scooter.save

#   i += 1
# end
# puts "Finished the Scooters! #{Scooter.all.count}"

# puts 'Creating fake doses...'

# Scooter.all.each do |Scooter|
#   i = 1
#   dose = Dose.new(
#     description: Faker::Food.measurement,
#     cocktail_id: cocktail.id,
#     ingredient_id: (1...50).to_a.sample
#   )
#   if dose.save
#   else
#     next
#   end
#   i += 1
# end

# puts 'Finished the doses!'

puts 'Finished all seed!'
