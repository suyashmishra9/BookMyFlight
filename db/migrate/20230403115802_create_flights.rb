class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :flight_no
      t.string :airline_name
      t.string :departure_airport
      t.string :arrival_airport
      t.time :departure_time
      t.time :arrival_time
      t.integer :available_seats , default: 210
      t.integer :total_seat , default: 210
      t.time :flight_duration
      t.decimal :total_price
      t.references :airline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
