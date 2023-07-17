class FlightsController < ApplicationController
   before_action :authenticate_user!, except: [:show]
   load_and_authorize_resource
  def index
  
  end
   
  def show
    @flight = Flight.find(params[:id])
  end

  def new
    @airline = Airline.find(params[:airline_id])
    @flight = @airline.flights.build
  end
  
  def create
    @airline = Airline.find(params[:airline_id])
    @flight = @airline.flights.build(flight_params)

    if @flight.save   
      redirect_to airline_path(@airline.id)
    else  
      render :new,  status: :unprocessable_entity
    end   
  end

  def edit
    @airline = Airline.find(params[:airline_id])
    @flight = Flight.find(params[:id])
  end
  
  def update
    @flight = Flight.find(params[:id])
 
    if @flight.update(flight_params)
      redirect_to airline_flight_path(@flight.airline_id)
    else 
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy 
    @flight = Flight.find(params[:id])
    @airline = @flight.airline
    @flight.destroy     

    redirect_to @airline, status: :see_other 
  end

  private
  def flight_params
    params.require(:flight).permit(:flight_no, :airline_name,:departure_airport,:arrival_airport,:departure_time ,:arrival_time ,:available_seats ,:total_seat ,:flight_duration ,:total_price , :airline_id)
  end
end