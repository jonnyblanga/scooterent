class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    start_date = params["reservation"]["start_date"]
    end_date = params["reservation"]["start_date"]
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.scooter = Scooter.find(params[:scooter_id])
    if (start_date.present? && end_date.present?)
      @reservation.start_date = start_date.split("to").first.strip
      @reservation.end_date = end_date.split("to").last.strip
      if @reservation.save!
        redirect_to scooter_reservation_path(@reservation.scooter, @reservation)
      end
    else
      redirect_to scooter_path(@reservation.scooter)
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
    review_linked = Review.where(reservation: @reservation)
    if review_linked
      review_linked.destroy_all
    end
    @reservation.destroy
    redirect_to  pages_user_page2_path
  end

  private
  def reservation_params
    params.require(:scooter_id)
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
