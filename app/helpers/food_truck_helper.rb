module FoodTruckHelper
  def build_query_string(food_trucks)
    querystring = "http://maps.googleapis.com/maps/api/distancematrix/json?sensor=false&units=imperial&origins=34.0634625,-118.3680602&destinations="
    
    food_trucks.each_with_index do |food_truck, index|
      querystring << (food_truck.latitude + "," + food_truck.longitude)
    	querystring << "|" unless (index == food_trucks.count - 1)
    end
    querystring
  end
end
