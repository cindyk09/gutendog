# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.new(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name, 
  email: Faker::Internet.email, 
  address1: Faker::Address.street_address, 
  address2: Faker::Address.secondary_address, 
  city: Faker::Address.city, 
  state: Faker::Address.state, 
  zipcode: Faker::Address.zip, 
  password: "password123", 
  password_confirmation: "password123"
  )

pet1 = Pet.new(
  name: Faker::Name.first_name, 
  description: Faker::Hipster.paragraph
  )

user1.pets << pet1

user1.save
pet1.save

start_time = Faker::Time.forward(rand(30))
end_time = start_time += (10000..20000).first

req = Request.new(
  start_time: start_time, 
  end_time: end_time, 
  pickup: true
  )

user1.requests << req



# Faker::Time.forward(rand(30))

# Faker::Name.first_name #=> "Kaci"

# Faker::Name.last_name #=> "Ernser"


# Faker::Name.name      #=> "Christophe Bartell"

# Faker::Internet.email #=> 

# Faker::Address.city #=> "Imogeneborough"

# Faker::Address.street_name #=> "Larkin Fork"

# Faker::Address.street_address #=> "282 Kevin Brook"

# Faker::Address.secondary_address #=> "Apt. 672"

# Faker::Address.building_number #=> "7304"

# Faker::Address.zip_code #=> "58517"

# Faker::Address.zip #=> "58517"

# Faker::Address.postcode #=> "58517"

# Faker::Address.time_zone #=> "Asia/Yakutsk"

# Faker::Address.street_suffix #=> "Street"

# Faker::Address.city_suffix #=> "fort"

# Faker::Address.city_prefix #=> "Lake"

# Faker::Address.state #=> "California"

# Faker::Address.state_abbr #=> "AP"

# Faker::Address.country #=> "French Guiana"

# Faker::Address.country_code #=> "IT"

# Faker::Address.latitude #=> "-58.17256227443719"
