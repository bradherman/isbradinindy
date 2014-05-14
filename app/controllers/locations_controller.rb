class LocationsController < ApiController
  protect_from_forgery except: [:create]

  def create
    checkin = Location.new(location_params)

    render json: {city: checkin.save.city}, callback: params[:callback]
  end

  protected

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
