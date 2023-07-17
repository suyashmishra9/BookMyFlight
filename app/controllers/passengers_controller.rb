class PassengersController < ApplicationController
   load_and_authorize_resource
   before_action :authenticate_user!
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @passenger = Passenger.new 
  end
  
  # def create 
    
  #  @passenger = Passenger.new(passenger_params)

  #  if @passenger.save   
  #     redirect_to @passenger 
  #  else  
  #    render :new,  status: :unprocessable_entity
  #   end   
  # end

  def edit
    @passenger = Passenger.find(params[:id])
  end
  
  def update
    @passenger = Passenger.find(params[:id])

     if @passenger.update(passenger_params)
      redirect_to @passenger
     else 
     render :edit , status: :unprocessable_entity
    end
  end

  def destroy 
    @passenger = Passenger.find(params[:id])
    @passenger.destroy

    redirect_to root_path, status: :see_other 
  end

  private
  def passenger_params
    params.require(:passenger).permit(:first_name, :last_name, :email_address, :phone_number)
  end
end


