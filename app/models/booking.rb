class Booking < ApplicationRecord
  belongs_to :passenger
  has_one :flight
end
