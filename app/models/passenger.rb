class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings, foreign_key: "passenger_id"
end
