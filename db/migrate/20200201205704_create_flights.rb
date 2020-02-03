class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|

      t.references :to_airport, class_name: "Airport"
      t.references :from_airport, class_name: "Airport"

      t.timestamps
    end
  end
end
