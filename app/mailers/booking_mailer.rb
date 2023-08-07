class BookingMailer < ApplicationMailer
  
  def booking_confirmation(booking, current_user)  # Remove the * from arguments
    @booking = booking
    mail(to: current_user.email, subject: 'Booking Confirmation')
  end
end
