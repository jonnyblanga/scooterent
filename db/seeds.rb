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

admin = User.new(
  name: "admin",
  birthday: Faker::Date.birthday(18, 65),
  address: "corso magenta 52, Milano, Italy",
  profile_pic: Faker::Avatar,
  license_photo: "https://www.mass.gov/files/styles/embedded_full_width/public/ma_drivers_license_6.jpg?itok=qY94oaB5",
  email: "admin@gmail.com",
  password: "123456"
)
admin.remote_profile_pic_url = Faker::Avatar.image
admin.remote_license_photo_url = "https://www.mass.gov/files/styles/embedded_full_width/public/ma_drivers_license_6.jpg?itok=qY94oaB5"
admin.save



15.times do
  user = User.new(
    name: Faker::Name.first_name,
    birthday: Faker::Date.birthday(18, 65),
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.remote_profile_pic_url = Faker::Avatar.image
  user.remote_license_photo_url = "https://www.mass.gov/files/styles/embedded_full_width/public/ma_drivers_license_6.jpg?itok=qY94oaB5"
  user.save
end

puts "Finished the Users! #{User.all.count}"

puts 'Creating faker Scooters...'

url = []
url << "https://images.unsplash.com/photo-1520205162745-8fa521b40cb9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1502&q=80"
url << "https://images.unsplash.com/photo-1494851199343-9e626cbee310?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
url << "https://images.unsplash.com/photo-1508500869162-9a582155012f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1495608312049-285ae516323d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
url << "https://images.unsplash.com/photo-1527484885616-7f73af7fade2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1520355256085-63034694ce01?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1528827997138-52e429c75136?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1453951115017-aa1460aa6973?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEzMDA0fQ&auto=format&fit=crop&w=1189&q=80"
url << "https://images.unsplash.com/photo-1508357710528-af900c15fe96?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1508357941501-0924cf312bbd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1515902683083-026d5ea138bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80"
url << "https://images.unsplash.com/photo-1501611724492-c09bebdba1ac?ixlib=rb-1.2.1&auto=format&fit=crop&w=1191&q=80"
url << "https://images.unsplash.com/photo-1481575184241-4754ea78a1bf?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1551278419-39c59fd4dab9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1551205144-0eddf477bce2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80"
url << "https://images.unsplash.com/photo-1524591652733-73fa1ae7b5ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1515902966800-95fac3b01698?ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80"
url << "https://images.unsplash.com/photo-1527905890126-e4d915153e25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80"
url << "https://images.unsplash.com/photo-1527484885616-7f73af7fade2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1457076098342-5ce69fc59d33?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1079&q=80"
url << "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1514826863517-464eed44915d?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"
url << "https://images.unsplash.com/photo-1510228093693-69337646d4c5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1057&q=80"
url << "https://images.unsplash.com/photo-1481376087113-81326096eb50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=1189&q=80"
url << "https://images.unsplash.com/photo-1471466054146-e71bcc0d2bb2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1528827997138-52e429c75136?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1547549082-6bc09f2049ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80"
url << "https://images.unsplash.com/photo-1502744688674-c619d1586c9e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1528262504524-55405ebf4e68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1476419972179-ac981d01257e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
url << "https://images.unsplash.com/photo-1542683088-abb3da334598?ixlib=rb-1.2.1&auto=format&fit=crop&w=1092&q=80"


i = 0
30.times do
  scooter = Scooter.new(
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    description: Faker::Lorem.paragraph,
    license_plate: Faker::Vehicle.license_plate,
    price: Faker::Commerce.price,
    engine: ["Disel", "Gasoline", "Eletrical", "gpl", "hybrid"].sample,
    user: User.all.sample,
    address: Faker::Address.street_address
    # latitude: Faker::Address.latitude,
    # longitude: Faker::Address.longitude
  )
  scooter.remote_image_url = url[i]
  scooter.save
i += 1
end

puts "Finished the Scooters! #{Scooter.all.count}"

puts 'Creating faker Reservations...'


dates = ["2019-03-14", "2019-03-15", "2019-03-16", "2019-03-17", "2019-03-20", "2019-03-25", "2019-03-30", "2019-04-03",  "2019-04-10",  "2019-04-14", "2019-04-16", "2019-04-20", "2019-04-29", "2019-05-02"]

n = 0
13.times do
  reservation = Reservation.create(
    start_date: dates[n],
    end_date: dates[n+1],
    user: User.all.sample,
    scooter: Scooter.all.sample
  )
  n+=1
end

puts "Finished the Reservations! #{Reservation.all.count}"



puts 'Creating faker Reviews...'
5.times do
  review = Review.create(
    comment: Faker::Lorem.paragraph,
    rating: Faker::Number.between(1, 5),
    reservation: Reservation.all.sample
  )

end

puts "Finished the Reviews! #{Review.all.count}"



puts 'Finished all seed!'
