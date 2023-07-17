class Booking < ApplicationRecord
  has_many :passengers , dependent: :destroy, inverse_of: :booking
  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: :all_blank
  belongs_to :flight
  after_create :generate_booking_code
  attribute :selected_seats, :string, default: ''

  def generate_booking_code
    last_booking = Booking.last 
    last_booking.booking_code = "BMF-000#{last_booking.id}"
    last_booking.save
  end
end
