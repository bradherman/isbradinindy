class Tweet < Notifier
  def send!
    BIRDIE.update(message)
  end
end