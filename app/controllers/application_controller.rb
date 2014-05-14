class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @current = Location.last.city.capitalize
  end
end
