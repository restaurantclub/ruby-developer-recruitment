# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Restaurant.delete_all
Zone.delete_all

Zone.create!(id: 1, name: 'Mazowsze')
Zone.create!(id: 2, name: 'Wielkopolska')
Zone.create!(id: 3, name: 'Małopolska')
Zone.create!(id: 4, name: 'Podlasie')

csv_file = Rails.root.join("db/restaurants.csv")

CSV.foreach(csv_file, headers: true)
   .map(&:to_h)
   .each do |rest_attrs|
  Restaurant.create!(rest_attrs)
end
