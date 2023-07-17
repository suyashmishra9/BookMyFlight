class BookingsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @booking = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end 

  def new
    @booking = Booking.new(flight_id: params[:flight_id]) 
    @booking.passengers.build
    @selected_seats = []
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save 
       @booking.flight.decrement!(:available_seats , @booking.passengers.count)
       MailjobJob.perform_now(@booking, current_user)
      redirect_to @booking
    else
      render :new , status:  :unprocessable_entity
    end   
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update 
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking 
    else
      render :edit , ststus:  :unprocessable_entity
    end   
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.flight.increment!(:available_seats , @booking.passengers.count)
    @booking.destroy

    redirect_to airlines_url , status: :see_other
  end   
 
  private

  def booking_params
    params.require(:booking).permit(:flight_info , :passenger , :booking_code , :status ,:total_price , :seat_no , :flight_id , :passenger_id , passengers_attributes: [:first_name , :last_name , :email_address, :phone_number , :booking_id, :_destroy])
  end
end
