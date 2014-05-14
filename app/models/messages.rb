class Messages
  class << self
    def location_changed(location)
      [location.indy ? pository : negatory, "I'm in #{location.city}"].join(" ")
    end

    def negatory
      ["Sorry guys,", "Don't cry, but", "See you soon, but for now"].sample
    end

    def pository
      ["Hell yeah,", "Fuck yeah,", "Don't freak out, but"].sample
    end
  end
end