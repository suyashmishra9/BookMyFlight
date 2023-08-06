
class UserMailerJob
  include Sidekiq::Job

  def perform(*booking, current_user)
    BookingMailer.booking_confirmation(booking, current_user.email).deliver_now
  end
end
