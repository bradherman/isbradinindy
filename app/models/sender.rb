class Sender
  attr_accessor :message, :services

  def initialize(message, *services)
    @message  = message
    @services = services.map{ |x| x.new message }
  end

  def send!
    return unless Rails.env.production?
    services.each{ |x| x.send! }
  end
end