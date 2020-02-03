# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create!(code: "LAX")
Airport.create!(code: "EWR")

10.times do |d|
  10.times do |n|
    Flight.create!(to_airport: Airport.find_by(code: "LAX"),
                   from_airport: Airport.find_by(code: "EWR"),
                   departure_time: Time.zone.now + n.hours + d.days,
                   arrival_time: Time.zone.now + (n+6).hours + d.days)
    Flight.create!(to_airport: Airport.find_by(code: "EWR"),
                   from_airport: Airport.find_by(code: "LAX"),
                   departure_time: Time.zone.now + (n+1).hours + d.days,
                   arrival_time: Time.zone.now + (n+1+4.5).hours + d.days)
  end
end
