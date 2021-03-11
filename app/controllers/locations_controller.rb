class LocationsController < ApplicationController
  before_action :require_login
  
  def index
    @locations = current_user.locations.all
  end

  def new
    @location = Location.new
  end

  def create

  end

  private

  def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end
