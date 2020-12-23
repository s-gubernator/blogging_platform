# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.destroy_all

25.times do
  first_name = Faker::Name.unique.first_name
  last_name  = Faker::Name.unique.last_name
  email      = Faker::Internet.unique.safe_email

  User.create!(first_name: first_name,
               last_name: last_name,
               email: email)
end

p "Created #{User.count} users"
