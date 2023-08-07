class BookingMailerJob
  include Sidekiq::Worker

  def perform(booking_id, user_id)  # Receive IDs as arguments
    booking = Booking.find_by(id: booking_id)
    user = User.find_by(id: user_id)
    BookingMailer.booking_confirmation(booking, user).deliver_now
    puts "Yehhhhhhhhhh Its Woooooooooooorking "
  end
end
