class ReviewsController < ApplicationController
    def new
    @review = Review.new
    @reservation = Reservation.find params[:reservation_id]
    @scooter = Scooter.find params[:scooter_id]
  end

  def create
    @reservation = Reservation.find params[:reservation_id]
    @review = Review.new(review_params)
    @review.reservation = @reservation
    if @review.save!
      redirect_to pages_user_page2_path
    else
      render :new
    end
  end
    private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
