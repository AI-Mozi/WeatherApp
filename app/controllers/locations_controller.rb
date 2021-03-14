require 'pry'
class LocationsController < ApplicationController
  def index
    show_locations
    @info = FetchWeatherInfo.call(show_locations)
    @current = @info["current"]
    @today = @info["hourly"]
    @week = @info["daily"]
  end

  def update
    add_location(params[:name])
    redirect_to locations_url 
  end

  private

  def location_params
    params.permit(:name)
  end

end
