class ReservationsController < ApplicationController
  def create
    start_date = params["reservation"]["start_date"].split("to").first.strip
    end_date = params["reservation"]["start_date"].split("to").last.strip
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.scooter = Scooter.find(params[:scooter_id])
    @reservation.start_date = start_date
    @reservation.end_date = end_date
    if @reservation.save!
      redirect_to scooter_reservation_path(@reservation.scooter, @reservation)
    end
  end

  def index
    Reservation.where(user: current_user)
  end

  def show
    @scooter
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
