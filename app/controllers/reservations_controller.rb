class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.scooter = Scooter.find(params[:scooter_id])
    if @reservation.save!
      redirect_to reservation_path(@reservation)
    end
  end

  def index
  end

  def show
    @scooter
    @reservation
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
