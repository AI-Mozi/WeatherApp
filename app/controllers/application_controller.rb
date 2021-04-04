class ApplicationController < ActionController::Base
  def location
    session[:location] ||= []
  end

  def add_location(name)
    location.clear
    name.downcase!
    location << name
  end

  def show_locations
    @locations = location
  end
end
