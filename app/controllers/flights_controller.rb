class FlightsController < ApplicationController

def index
  @flights = Flight.all
  @departing_flights = @flights.select("from_airport_id").distinct.
    map{ |flight| [flight.from_airport.name, flight.from_airport_id]}
  @arriving_flights = @flights.select("to_airport_id").distinct.
    map{ |flight| [flight.to_airport.name, flight.to_airport_id]}
  @passenger_count = (1..4).to_a
  @dates = @flights.select("departure").distinct.map{|flight| [flight.departure.
    strftime("%m/%d/%Y"), flight.departure]}
end

end
