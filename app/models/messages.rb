class Messages
  class << self
    def location_changed(city)
      [interjections.sample, 'Brad has changed locations to', city].join(' ')
    end

    def interjections
      ["Holy shit!", "You won't believe this shit, but", "Great Gotham!", "No fucking way,", "Guess what."]
    end
  end
end