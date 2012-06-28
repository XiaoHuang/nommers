class FoodTrucksController < ApplicationController
  def map
    @food_trucks = FoodTruck.order(:name)
  end
  def index
    Geokit::Geocoders::google = "AIzaSyDjpc3N49wLGD0LtRTkwIjxrRBDx1hAaco"
    loc = GeoKit::Geocoders::GoogleGeocoder.geocode params[:location]
    loc = loc.ll.split(',')
    @food_trucks = FoodTruck.near(loc[0], loc[1], 5)
  end
end