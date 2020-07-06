# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

csv_text = File.read(Rails.root.join("lib", "car_ad.csv"))
csv = CSV.parse(csv_text.scrub, headers: true)

csv.each do |row|
  t = Product.create!(
    del: 0,
    name: row["car"],
    price: row["price"],
    body: row["body"],
    mileage: row["mileage"],
    engV: row["engV"],
    engType: row["engType"],
    registration: row["registration"],
    year: row["year"],
    model: row["model"],
    drive: row["drive"],
  )
  puts "#{t.name}, #{t.price} saved"
end

@admin = User.create!(name: "admin",
                      email: "admin@admin.com",
                      role: 1,
                      password: "123",
                      password_confirmation: "123",
                      activated: true,
                      activated_at: Time.zone.now)

20.times do |n|
  name = Faker::Name.name
  email = "user#{n + 1}@user.com"
  password = "123"
  User.create!(name: name,
               email: email,
               activated: true,
               activated_at: Time.zone.now,
               password: password,
               password_confirmation: password)

  # state = ((n + 1) % 3) + 1
  # @admin.orders.create!(product: product, state: state)
  # Order.create!(user_id: 2, product: product, state: state)
end
