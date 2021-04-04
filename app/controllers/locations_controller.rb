class LocationsController < ApplicationController
  def index
    @location = show_locations[0]
    unless @location.blank?
      @info = FetchWeatherInfo.call(show_locations)
      if @info.present?
        @current = @info["current"]
        @today = @info["hourly"]
        @week = @info["daily"]
      else
        redirect_to root_path, notice: "Wrong city name!"
      end
    else
      redirect_to root_path, notice: "Wrong city name!"
    end
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
