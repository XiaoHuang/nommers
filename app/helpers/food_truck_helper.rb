module FoodTruckHelper
  def google_distance_query_string(food_trucks, location)
    querystring = "https://maps.googleapis.com/maps/api/distancematrix/json?sensor=false&origins=#{location}&destinations="
    
    food_trucks.each_with_index do |food_truck, index|
      querystring << (food_truck.latitude + "," + food_truck.longitude)
    	querystring << u("|") unless (index == food_trucks.count - 1)
    end
    querystring
  end
  
  def food_trucks_nearby(food_trucks, distance_threshold, location = "34.0634625,-118.3680602")
    q = google_distance_query_string(food_trucks, location)
    nearby = []
    
    require 'open-uri'
    file = open(q)
    json = ActiveSupport::JSON.decode(file.read)

    json['rows'][0]['elements'].each_with_index do |x, index|
      truck_distance = x['distance']['value']
      if truck_distance <= distance_threshold
        nearby << { distance: truck_distance, name: food_trucks[index].name }
      end
    end
    
    nearby
    
  end
end
