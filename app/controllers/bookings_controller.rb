class BookingsController < ApplicationController
  def index
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:passenger_count].to_i.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = 'Your flight has been booked!'
      redirect_to @booking
    else
      flash[:warning] = "There was an error in saving your booking"
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, booking_attributes: [:id, :flight_id], passengers_attributes: [:name, :email])
    end

end
