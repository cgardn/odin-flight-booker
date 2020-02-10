class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(booking_form_params[:flightid])
    
    booking_form_params[:passengercount].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new
    @booking.flight = Flight.find(booking_params[:flightid])
    
    # feels hacky, having to index the attribute hash, but whatevs?
    booking_params[:passengers_attributes].each do |p|
      # p[1] is the hash of {name: name, email: email}
      @booking.passengers.build(p[1])
      PassengerMailer.with(passenger: p[1]).thank_you.deliver_later
    end

    if @booking.save
      redirect_to @booking
    else
      puts "**--!!--** Didn't save!! **--!!--**"
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.all
  end

  private
    def booking_form_params
      params.require(:booking_form).permit(:flightid, :passengercount)
    end

    def booking_params
      params.require(:booking).permit(:flightid, passengers_attributes: [:id, :name, :email])
    end

end
