class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @scooters_rand = Scooter.all.sample(3)
  end
end
