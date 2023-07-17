class MailjobJob < ApplicationJob
  queue_as :default

  def perform(*booking, current_user)
    BookingMailer.booking_confirmation(booking, current_user.email).deliver_now
  end
end
