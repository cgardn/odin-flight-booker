class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.flight = bookingparams[:flight_id]
    if @booking.save
      redirect_to @booking
    else
      flash[:warning] = "Problem with booking"
      redirect_back(fallback_location: root_url)
    end
  end

  def show
  end

  private
    def bookingparams
      params.require(:booking).permit(:flight_id, :passengercount)
    end

end
