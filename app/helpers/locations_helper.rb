module LocationsHelper
  def dt(timezone)
    Time.at(timezone).strftime("%d %B %Y")
  end
end
