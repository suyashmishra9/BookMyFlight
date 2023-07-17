class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :flights , through: :bookings
  has_many :airlines , through: :bookings
end
