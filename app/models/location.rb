class Location < ActiveRecord::Base
  before_validation   :reverse_geocode
  
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

  def notify
    msg = Messages.location_changed(self)
    Sender.new(msg, Tweet, Page).send!
  end
end
