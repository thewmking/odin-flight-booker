class FlightsController < ApplicationController

  def index
    search_initialize
    search_results(params)
  end

  def search_initialize
    @flights = Flight.all
    @airports = Airport.pluck(:name, :id).sort
    @passenger_count = (1..4).to_a
    @dates = @flights.pluck(:departure).map{ |d| [ d.strftime("%m/%d/%Y"), d.to_date ]}.uniq.sort
  end

  def search_results(params)
    if !params[:departure].blank?
      date = params[:departure].to_date
      @available_flights = Flight.where(from_airport_id: params[:from_airport_id],
                              to_airport_id: params[:to_airport_id],
                              departure: date.beginning_of_day..date.end_of_day)
                       .includes(:from_airport, :to_airport)
    else
      @available_flights = nil
    end
  end

end
