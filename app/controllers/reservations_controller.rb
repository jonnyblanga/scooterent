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
      redirect_to reservation_path(@reservation)
    end
  end

  def index
  end

  def show
    @scooter #= Scooter.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to reservations_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:scooter_id)
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
