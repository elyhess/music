# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails db:purge db:migrate db:seed (to reset autoincremented ids)

Venue.destroy_all
Event.destroy_all

Band.destroy_all
Member.destroy_all

FactoryBot.create_list(:venue, 20)

Venue.all.each do |venue|
  10.times do
    venue.events.create(name: FFaker::Company.bs)
  end
end

FactoryBot.create_list(:band, 20)

Band.all.each do |band|
  10.times do
    band.members.create(name: FFaker::Company.bs)
  end
end