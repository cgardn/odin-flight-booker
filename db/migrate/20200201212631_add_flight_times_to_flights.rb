class AddFlightTimesToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :departure_time, :datetime
    add_column :flights, :arrival_time, :datetime
  end
end
