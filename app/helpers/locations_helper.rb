module LocationsHelper
  def dt(timezone)
    Time.at(timezone).strftime("%d %B %Y")
  end

  def image(code, size)
    "http://openweathermap.org/img/wn/#{code}#{size}.png"
  end

  def sun(timezone)
    Time.at(timezone).strftime("%H:%M")
  end
end
