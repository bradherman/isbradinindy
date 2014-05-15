class Location < ActiveRecord::Base
  before_validation   :reverse_geocode
  
  after_create        :notify
  after_create        :set_attrs

  validate :checked_in?

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    obj.city = results.first.city if results.first
  end

  class << self
    def indy?
      self.last.indy?
    end
  end

  def date
    created_at.strftime('%D')
  end

  def as_json(options={})
    {city: city, date: date}
  end

  private

  def set_attrs
    self.update(indy: true) if city.downcase == 'indianapolis'
  end

  def notify
    msg = Messages.location_changed(self)
    Sender.new(msg, Tweet, Page).send!
  end

  def checked_in?
    errors.add(:city, 'already checked in') if Location.last.city == self.city
  end
end
