class LocationsController < ApiController
  protect_from_forgery except: [:create]

  def index
    render json: Location.page, callback: params[:callback]
  end

  def create
    checkin = Location.save(location_params)

    if checkin.save
      json    = { city: checkin.city }
      status  = 200
    else
      json = { message: checkin.errors.full_messages*',' }
      status  = 422
    end

    render status: status, json: json, callback: params[:callback]
  end

  protected

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
