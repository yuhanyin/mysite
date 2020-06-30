# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "admin",
             email: "admin@admin.com",
             role: 1,
             password: "123",
             password_confirmation: "123",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@exp.org"
  password = "123"
  User.create!(name: name,
               email: email,
               activated: true,
               activated_at: Time.zone.now,
               password: password,
               password_confirmation: password)
end
