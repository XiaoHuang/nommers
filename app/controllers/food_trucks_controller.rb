class FoodTrucksController < ApplicationController
  def map
    @food_trucks = FoodTruck.order(:name)
  end
  def index
    unless params[:location].nil?
      Geokit::Geocoders::google = "AIzaSyDjpc3N49wLGD0LtRTkwIjxrRBDx1hAaco"
      loc = GeoKit::Geocoders::GoogleGeocoder.geocode params[:location]
      loc = loc.ll.split(',')
      @my_long = loc[0]
      @my_lat = loc[1]
      @food_trucks = FoodTruck.near(@my_long, @my_lat, 5)
      
      if current_user
			  current_user[:last_location] = params[:location]
			  current_user.save
			end
			
    else
      @food_trucks = nil
    end
  end
end