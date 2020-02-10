class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def thank_you
    @passenger = params[:passenger]
    mail(to: @passenger["email"], subject: "Thank you for booking with Odin Flights!")
  end
end
