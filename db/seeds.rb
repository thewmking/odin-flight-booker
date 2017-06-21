# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Airport.delete_all
#Flight.delete_all

Airport.create([{ name: 'SFO' }, { name: 'NYC' }, { name: 'RDU' }, { name: 'LAX' }])

30.times do |n|
  from, to = 0, 0
  until from != to
    from = rand(1..4)
    to   = rand(1..4)
  end
  Flight.create(from_airport_id: from,
                to_airport_id:   to,
                departure: n.days.from_now,
                duration: rand(4..7))
end
