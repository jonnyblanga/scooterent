class ScootersController < ApplicationController
  before_action :find_scooter, only: [:show]
  def index
    @scooters = Scooter.where.not(latitude: nil, longitude: nil)

    @markers = @scooters.map do |scooter|
      {
        lng: scooter.longitude,
        lat: scooter.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { scooter: scooter }),
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def show
    @scooter
    @reservation = Reservation.new
  end

  def new
    @scooter = Scooter.new
    @reservation = Reservation.new
  end

  def create
    @scooter = Scooter.new(scooter_params)
    @scooter.user = current_user
    if @scooter.save!
      redirect_to scooter_path(@scooter)
    else
      render :new
    end
  end


  private
  def scooter_params
    params.require(:scooter).permit(:make, :model, :year, :license_plate, :price, :engine, :description, :photo)
  end

  def find_scooter
    @scooter = Scooter.find(params[:id])
  end
end
