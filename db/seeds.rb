# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# puts "Seeding users..."
#
# 20.times do
#
#   user1 = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone_number: Faker::PhoneNumber.phone_number,
#     email: Faker::Internet.email,
#     address1: Faker::Address.street_address,
#     address2: Faker::Address.secondary_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state,
#     zipcode: Faker::Address.zip,
#     password: "password123",
#     password_confirmation: "password123"
#   )
#
#   n = rand(4) + 1
#
#   n.times do
#     pet1 = Pet.new(
#       name: Faker::Name.first_name,
#       description: Faker::Hipster.paragraph
#     )
#     user1.pets << pet1
#
#     user1.save
#     pet1.save
#   end
# end
#
# puts "Making requests"
#
#
# 15.times do
#
#   user1 = nil
#   while user1.nil?
#     user1 = User.find_by(id: (rand(User.all.count) + 1))
#   end
#
#   start_time = Faker::Time.forward(rand(30))
#   end_time = start_time += (10000..20000).first
#
#   req = Request.new(
#     start_time: start_time,
#     end_time: end_time,
#     pickup: true
#   )
#
#   user1.requests << req
#   req.save
#   user1.save
# end

# puts "Creating some walks"
#
# 15.times do
#   Walk.create(walker_id: User.find(rand(User.all.count)), request_id: rand(Request.all.count) + 1)
# end


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


# Update Users With Geocoded NYC Addresses

addresses = ["15 William Street, 24H, Financial District, New York",
"33 West 56th Street, 5E, Midtown, New York",
'50 East 80th Street, 2A/3B, Upper East Side, New York',
'82 Charles Street, 1R, West Village, New York',
'2077 Fifth Avenue, 4A, Harlem, New York',
'5 Beekman Street, 42A, Financial District, New York',
'630 First Avenue, 28RS, Murray Hill, New York',
'385 Grand Street, L1004, Lower East Side, New York',
'25-19 43rd Avenue, 206, Long Island City, New York',
'77 Park Terrace East, D75, Inwood, New York',
'240 Riverside Boulevard, 17C, Upper West Side, New York',
'250 East 53rd Street, 3301, Midtown, New York',
'37 West 21st Street, 402, Flatiron District, New York',
'200 North End Avenue, 31E, Battery Park City, New York',
'100 West 26th Street, 17B, Flatiron District, New York',
'610 West 110th Street, 11E, Upper West Side, New York',
'32 Marble Hill Avenue, Bronx, New York',
'201 East 2nd Street, 2C, East Village, New York',
'120 MACDOUGAL Street, 26, Greenwich Village, New York',
'10-55 47th Avenue, 2H, Long Island City, New York',
'488 Graham Avenue, 2, Greenpoint, New York',
'47 Weirfield Street, 2, Bushwick, New York',
'235 West 103rd Street, 5E, Upper West Side, New York',
'28-21 Astoria Boulevard, 3D, Astoria, New York',
'189 Schermerhorn Street, 24H, Boerum Hill, New York',
'1009 Lorimer Street, 2, Greenpoint, New York',
'91 Joralemon Street, 2, Brooklyn Heights, New York',
'407 Myrtle Avenue, 2, Fort Greene, New York',
'4 West 105th Street, 3A, Upper West Side, New York',
'267 East 10th Street, 9, East Village, New York',
'55 Thompson Street, PH2, SoHo, New York',
'27 West 72nd Street, 210, Upper West Side, New York',
'39 West 68th Street, 2, Upper East Side, New York',
'240 East 86th Street, 18L, Upper East Side, New York',
'450 North End Avenue, 18E, Battery Park City, New York',
'100 Jane Street, 2D, West Village, Meatpacking District, New York',
'66 Pearl Street, 203, Financial District, New York',
'160 West 62nd Street, 11C, Lincoln Square, New York',
'455 West 23rd Street, 4E, Chelsea, New York',
'138 East 12th Street, 7D, East Village, New York',
'145 West 58th Street, 5F, Midtown, New York',
'525 East 72nd Street, 33C, Upper East Side, New York',
'10 Gramercy Park South, 4R, Gramercy, New York',
'265 East 66th Street, 27D, Upper East Side, New York',
'19 St Marks Pl, 4B, East Village, New York',
'215 East 66th Street, 203, Upper East Side, New York',
'241 South 2nd Street, 3A, Williamsburg, New York',
'238 East 106th Street, PHB, East Harlem, New York',
'120 East 34th Street, 18J, Murray Hill, New York',
'200 East 33rd Street, 16C, Kips Bay, New York']
User.all.each{|user|
  user.address1, user.address2, user.city, user.state = addresses.pop.split(", ")
  user.zipcode = ''
  user.geocode
  user.save
}
