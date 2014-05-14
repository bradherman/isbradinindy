class Location < ActiveRecord::Base
  before_validation   :reverse_geocode
  
  after_create        :clear
  after_create        :notify
  after_create        :set_attrs

  validates :city, uniqueness: true

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    obj.city = results.first.city if results.first
  end

  class << self
    def indy?
      self.last.indy?
    end
  end

  private

  def set_attrs
    self.update(indy: true) if city.downcase == 'indianapolis'
  end

  def clear
    Location.first.destroy if Location.count > 1
  end

  def notify
    return unless Rails.env.production?
    msg = Messages.location_changed(city)
    BIRDIE.update(msg)
  end
end
