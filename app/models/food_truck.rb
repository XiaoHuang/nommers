class FoodTruck < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude

  def self.near(lat, long, distance_threshold)
=begin
    api_key = "AIzaSyDjpc3N49wLGD0LtRTkwIjxrRBDx1hAaco"
    
    food_trucks = FoodTruck.order(:name) # is this the right place for this?
    querystring = "https://maps.googleapis.com/maps/api/distancematrix/json?key=#{api_key}sensor=false&origins=#{lat},#{long}&destinations="
    food_trucks.each_with_index do |food_truck, index|
      querystring << (food_truck.latitude + "," + food_truck.longitude)
    	querystring << URI.encode("|") unless (index == food_trucks.count - 1)
    end
        
    nearby = []
    

    require 'open-uri' # should this be defined at the top of the method?
    file = open(querystring)
    json = ActiveSupport::JSON.decode(file.read)
    
    puts json.inspect

    json['rows'][0]['elements'].each_with_index do |x, index|
      truck_distance = x['distance']['value']
      if truck_distance <= distance_threshold
        nearby << { distance: truck_distance, name: food_trucks[index].name }
      end
    end
=end
    
    require 'geokit'
    nearby = []
    
    here = Geokit::LatLng.new(lat, long)
    
    food_trucks = FoodTruck.order(:name)
    food_trucks.each_with_index do |food_truck, index|
      dist = here.distance_to Geokit::LatLng.new(food_truck.latitude, food_truck.longitude)
      if dist < distance_threshold
        nearby << { distance: dist, name: food_truck[:name] }
      end
    end
    
    nearby
  end
end
