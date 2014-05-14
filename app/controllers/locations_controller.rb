class LocationsController < ApiController
  def create
    checkin = Location.new(location_params)

    render json: checkin.save, callback: params[:callback]
  end

  protected

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
