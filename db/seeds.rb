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
Review.destroy_all
Reservation.destroy_all
Scooter.destroy_all
User.destroy_all

puts 'Creating fake User...'


15.times do
  user = User.create(
    name: Faker::Name.first_name,
    birthday: Faker::Date.birthday(18, 65),
    address: Faker::Address.street_address,
    license_photo: Faker::Avatar.image,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

end

puts "Finished the Users! #{User.all.count}"

url = []
url << "https://images.unsplash.com/photo-1505164912965-def2a2a01d4b?ixlib=rb-1.2.1&dpr=2&auto=format&fit=crop&w=525&q=60"
url << "https://images.unsplash.com/photo-1516908943150-a2494e04a52d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
url << "https://images.unsplash.com/photo-1480544967375-135f88f06bc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
url << "https://images.unsplash.com/photo-1494851199343-9e626cbee310?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
url << "https://images.unsplash.com/photo-1516423485787-e433022a4801?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
url << "https://images.unsplash.com/photo-1518281989264-a47a2ee4bbb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
url << "https://images.unsplash.com/photo-1495608312049-285ae516323d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"

puts 'Creating faker Scooters...'

30.times do
  scooter = Scooter.create(
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    description: Faker::Lorem.paragraph,
    photo: url.sample,
    license_plate: Faker::Vehicle.license_plate,
    price: Faker::Commerce.price,
    engine: ["Disel", "Gasoline", "Eletrical", "gpl", "hybrid"].sample,
    user: User.all.sample,
    address: Faker::Address.street_address
    # latitude: Faker::Address.latitude,
    # longitude: Faker::Address.longitude
  )
end

puts "Finished the Scooters! #{Scooter.all.count}"

puts 'Creating faker Reservations...'

15.times do
  reservation = Reservation.create(
    start_date: Faker::Date.between(Date.today, 10.days.from_now ),
    end_date: Faker::Date.between(20.days.from_now, 30.days.from_now ),
    user: User.all.sample,
    scooter: Scooter.all.sample
  )
end

puts "Finished the Reservations! #{Reservation.all.count}"



puts 'Creating faker Reviews...'
50.times do
  review = Review.create(
    comment: Faker::Lorem.paragraph,
    rating: Faker::Number.between(1, 5),
    reservation: Reservation.all.sample
  )

end

puts "Finished the Reviews! #{Review.all.count}"



puts 'Finished all seed!'
