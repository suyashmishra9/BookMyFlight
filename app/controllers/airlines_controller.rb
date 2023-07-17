class AirlinesController < ApplicationController
   load_and_authorize_resource
   before_action :authenticate_user!, except: [:index, :show]

  def index
    @airline = Airline.all
  end


  def show
    @airline = Airline.find(params[:id])

    if params[:departure_airport].present? && params[:arrival_airport].present?
    departure_airport = params[:departure_airport].strip.downcase
    arrival_airport = params[:arrival_airport].strip.downcase

    @flightsearch = @airline.flights.where("LOWER(departure_airport) LIKE ? AND LOWER(arrival_airport) LIKE ?", "%#{departure_airport}%", "%#{arrival_airport}%").page(params[:page]).per(5)

    else
     @flightsearch = @airline.flights.page(params[:page])
    end
  end


  def new
    @airline = Airline.new
  end 
  
  def create 
   @airline  = Airline.new(airline_params)

   if @airline.save
      redirect_to @airline   
     else
     render :new , status: :unprocessable_entity 
    end
  end

  def edit
    @airline = Airline.find(params[:id])
  end 
  
  def update
    @airline = Airline.find(params[:id]) 

    if @airline.update(airline_params)
      redirect_to @airline
     else
      render :edit , status: :unprocessable_entity
    end 
  end    

  def destroy
    @airline = Airline.find(params[:id])
    
    @airline.destroy
    redirect_to @airline, status: :see_other
  end

 private
  def airline_params
    params.require(:airline).permit(:name , :code)
  end  
end  