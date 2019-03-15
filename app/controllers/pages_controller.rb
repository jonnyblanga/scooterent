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

  def user_page4
    @user = current_user
    @scooters = Scooter.where(user: @user)
    my_res = []
    @scooters.each do |scooter|
        scooter.reservations.each do |res|
        my_res << res
      end
    end
    @reservations = my_res
  end
end
