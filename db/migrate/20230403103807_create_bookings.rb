class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :flight_info
      t.string :passenger
      t.string :booking_code
      t.string :status
      t.string :seat_no
      t.references :flight, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
