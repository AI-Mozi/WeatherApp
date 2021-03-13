require 'pry'
class LocationsController < ApplicationController
  def index
    show_locations
    render(:index)
  end

  def update
    flash[:notice] = "You just added a location!"
    add_location(params[:name])
    redirect_to locations_url 
  end

  private

  def location_params
    params.permit(:name)
  end

end
