class FlightsController < ApplicationController

  def index

    # change this to use direct SQL or Active Record, to push the selection of unique dates
    #   into the database and cut down on pulling every flight out of the db into memory first
    @dates = Flight.all.map{ |f| f.departure_time.strftime("%m-%d-%Y") }.uniq

    @airportcodes = Airport.all.map{ |a| [a.code, a.id] }


    if params[:date]
      @date = params[:date]
      #day = Time.strptime(params[:search][:date], "%m-%d-%Y").day
      day = Time.strptime(params[:date], "%m-%d-%Y").day
      allflights = Flight.all

      @flights = allflights.filter{ |f| (f.departure_time.day == day) }
      #@flights = allflights
      
      @flights.each do |f|
        dep = @airportcodes[f.from_airport_id-1][0]
        arr = @airportcodes[f.to_airport_id-1][0]
        depT = f.departure_time.strftime("%I:%M")
        arrT = f.arrival_time.strftime("%I:%M")
        puts "#{dep} . #{depT} -> #{arr} . #{arrT}"
      end
    end

  end
end
