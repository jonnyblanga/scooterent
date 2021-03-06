class ScootersController < ApplicationController
  before_action :find_scooter, only: [:show, :edit, :update, :destroy]
  # before_action :query_params
  def index
    @query = params[:query]
    if @query.empty?
      @scooters = Scooter.where.not(latitude: nil, longitude: nil)
    else
      @scooters = Scooter.near(@query, 1000) if @query
    end

    @markers = @scooters.map do |scooter|
      {
        lng: scooter.longitude,
        lat: scooter.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { scooter: scooter })
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def show

    @reviews = Review.where(reservation: Reservation.where(scooter: @scooter)).all

    @markers = [
        {
        lng: @scooter.longitude,
        lat: @scooter.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { scooter: @scooter })
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }]

    @reservation = Reservation.new

    @reservations = @scooter.reservations
    @availability_array = []
    @reservations.each do |reservation|
      @availability_array << {from: reservation.start_date, to: reservation.end_date}
    end
    @availability_array
  end

  def new
    @scooter = Scooter.new
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

  def edit
  end

  def update
    @scooter.update(scooter_params)
    redirect_to scooter_path(@scooter)
  end

  def destroy
    @scooter.destroy
    redirect_to pages_user_page3_path
  end

  private
  def scooter_params
    params.require(:scooter).permit(:make, :model, :year, :license_plate, :price, :engine, :description, :photo)
  end

  def find_scooter
    @scooter = Scooter.find(params[:id])
  end

  # def query_params
  #   params.require(:query).permit
  # end
end
