class FixBookingColumnNames < ActiveRecord::Migration[5.2]
  change_table :bookings do |t|
    t.rename :flight_id_id, :flight_id
    t.rename :passenger_id_id, :passenger_id
  end
end
