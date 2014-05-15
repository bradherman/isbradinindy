class LocationsController < ApiController
  protect_from_forgery except: [:create]

  def index
    render json: Location.page, callback: params[:callback]
  end

  def create
    checkin = Location.create(location_params)

    render json: {city: checkin.city}, callback: params[:callback]
  end

  protected

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
