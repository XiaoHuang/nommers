class FoodTruck < ActiveRecord::Base
  attr_accessor :distance
  attr_accessible :name, :address, :latitude, :longitude, :handle
  has_and_belongs_to_many :fans, class_name: "User"

  def self.near(lat, long, distance_threshold)
    require 'geokit'

    here = Geokit::LatLng.new(lat, long)

    food_trucks = FoodTruck.order(:name)
    food_trucks.delete_if do |food_truck|
      food_truck.distance = here.distance_to Geokit::LatLng.new(food_truck.latitude, food_truck.longitude)
      food_truck.distance > distance_threshold
    end
    food_trucks.sort! {|x, y| x.distance.to_f <=> y.distance.to_f }
  end
end
