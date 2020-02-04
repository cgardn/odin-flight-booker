class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|

      t.references :flight_id, class_name: "Flight"
      t.references :passenger_id, class_name: "Passenger"

      t.timestamps
    end
  end
end
