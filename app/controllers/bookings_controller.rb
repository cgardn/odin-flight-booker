class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    #@booking.flight = Flight.find(params[:booking][:flightid])
    @booking.flight = Flight.find(bookingparams[:flightid])
    @passengercount = bookingparams[:passengercount]
  end

  def show
  end

  private
    def bookingparams
      params.require(:booking).permit(:flightid, :passengercount)
    end

end
