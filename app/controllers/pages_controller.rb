class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @scooters_rand = Scooter.all.sample(3)
  end

  def user_page
    @user = current_user
    @scooters = Scooter.where(user: @user)
    @reservations = Reservation.where(user: @user)
  end

  def user_page2
    @user = current_user
    @scooters = Scooter.where(user: @user)
    @reservations = Reservation.where(user: @user)
  end

  def user_page3
    @user = current_user
    @scooters = Scooter.where(user: @user)
    @reservations = Reservation.where(user: @user)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save!
      redirect_to pages_user_page2_path
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
