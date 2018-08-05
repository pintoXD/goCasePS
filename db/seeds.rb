# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


# t.string "name"
# t.integer "age"
# t.string "gender"
# t.string "location"
# t.boolean "flag"
Survivor.destroy_all

50.times do |i|
	Survivor.create({
    id: i,
		name: Faker::Name.unique.name,
		age: Faker::Number.unique.number(2),
    gender: Faker::Gender.binary_type,
    flag: Faker::Boolean.boolean,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
	})
end

# 50.times do |i|
#
#     survivor = Survivor.find_by(id: i)
#
#     survivor.latitude: Faker::Address.latitude
#
#     survivor.longitude: Fake::Address.longitude
#
#
# end
