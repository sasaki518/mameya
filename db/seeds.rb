# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shop = Shop.create(name: "A coffee stand", description: "test", email: "shopA@example.com", password: "password", password_confirmation: "password")
p shop.errors.full_messages
Shop.create(name: "B Cafe", description: "test", email: "shopB@example.com", password: "password", password_confirmation: "password")

User.create(name: "guest A", email: "userA@example.com", password: "password", password_confirmation: "password", confirmed_at: Time.zone.now)
User.create(name: "guest B", email: "userB@example.com", password: "password", password_confirmation: "password", confirmed_at: Time.zone.now)
