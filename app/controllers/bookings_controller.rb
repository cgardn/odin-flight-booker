class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(bookingparams[:flightid])
    
    bookingparams[:passengercount].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new
    @booking.flight = Flight.find(bookingparams[:flightid])
  end

  def show
  end

  private
    def bookingparams
      params.require(:booking).permit(:flightid, :passengercount)
    end

end
