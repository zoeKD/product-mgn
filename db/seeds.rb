# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"
require_relative "../app/models/user"
require_relative "../app/models/product"
require_relative "../app/models/price"

CURRENCY = %w(eur usd jpy gdp)


User.create(
  username: "Dupont",
  email: "dupont@gmail.com",
  password: "superdupont")

User.create(
  username: "admin",
  email: "admin@gmail.com",
  password: "superadmin",
  admin: true)

100.times do

  product = Product.create(
    name: Faker::Space.meteorite,
    size: rand(10),
    user: User.find_by(username: "Dupont"),
  )
  rand(1..4).times do
    Price.create(currency: CURRENCY.sample, value: rand(1000), product: product)
  end
end

puts "finished seeding"
