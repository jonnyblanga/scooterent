class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.scooter = Scooter.find(params[:scooter_id])
    if @reservation.save!
      redirect_to scooter_reservation_path(@reservation.scooter, @reservation)
    end
  end

  def index
    Reservation.where(user: current_user)
  end

  def show
    @reservations_array = dates_reserved
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to scooter_reservations_path
  end

  private
  def reservation_params
    params.require(:scooter_id)
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
