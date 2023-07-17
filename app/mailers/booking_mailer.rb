class BookingMailer < ApplicationMailer

  def booking_confirmation(*booking, current_user)
    @booking = Booking.find_by(id: booking)
    mail(to: current_user, subject: 'Booking Confirmation')
  end
end
