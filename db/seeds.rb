# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'cleaning up database...'
Restaurant.destroy_all
puts 'database is clean!'


puts 'Creating restaurants and reviews'
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::Config.locale = 'pt-BR',
    category: Restaurant::CATEGORIES.sample
  )
  2.times do
    Review.create!(
      restaurant: restaurant,
      content: Faker::Restaurant.review,
      rating: rand(1..5)
    )
  puts "restaurant #{restaurant.id} is created."
  end
end
puts 'All Done!'
