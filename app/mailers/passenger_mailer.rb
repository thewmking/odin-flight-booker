class PassengerMailer < ApplicationMailer

  def thank_you_email(booking, passengers, flight)
    @passengers = passengers.to_a
    @booking    = booking
    @flight     = flight
    mail(to: Proc.new { @passengers.pluck(:email) },
         subject: "Flight Booking Confirmation ##{@booking.id}")
  end
end
