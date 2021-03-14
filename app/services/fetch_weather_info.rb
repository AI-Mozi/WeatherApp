require 'pry'
class FetchWeatherInfo < ApplicationService
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    lon = check_coords["lon"]
    lat = check_coords["lat"]
    @todays_weather_info = RestClient.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&&units=metric&appid=#{api_key}")
    return @parsed_todays_weather_info = JSON.parse(@todays_weather_info)
  end

  def check_coords
    @weather_info = RestClient.get("api.openweathermap.org/data/2.5/weather?q=#{name[0]}&appid=#{api_key}")
    @coords = JSON.parse(@weather_info)
    return @coords["coord"]
  end

  private

  def api_key
    ENV['API_KEY']
  end
end