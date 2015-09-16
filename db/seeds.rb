# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

500.times do
  height = rand(55..85)
  weight = rand(135..255)
  Person.create(height: height, weight: weight, gender: 'M')
end

500.times do
  height = rand(50..80)
  weight = rand(105..225)
  Person.create(height: height, weight: weight, gender: 'F')
end