class FoodTrucksController < ApplicationController
  def map
    @food_trucks = FoodTruck.order(:name)
  end
  def index
    @food_trucks = FoodTruck.near("34.0634625", "-118.3680602", 5)
  end
end
