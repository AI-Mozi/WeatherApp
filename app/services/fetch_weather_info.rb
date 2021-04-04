class FetchWeatherInfo < ApplicationService
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    url = "api.openweathermap.org/data/2.5/weather?q=#{name[0]}&appid=#{api_key}"

    weather_info = RestClient::Request.execute(method: 'get', url: url)
    cords = JSON.parse(weather_info)["coord"]
    
    wurl = "https://api.openweathermap.org/data/2.5/onecall?lat=#{cords["lat"]}&lon=#{cords["lon"]}&exclude=minutely&&units=metric&appid=#{api_key}"
    todays_weather_info = RestClient::Request.execute(method: 'get', url: wurl)
    
    return parsed_todays_weather_info = JSON.parse(todays_weather_info)
    
    rescue RestClient::Exception
      return nil
      
    rescue URI::InvalidURIError
      return nil
  end

  private

  def api_key
    ENV['API_KEY']
  end
end