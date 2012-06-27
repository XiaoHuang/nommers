class FoodTrucksController < ApplicationController
  def map
    @food_trucks = FoodTruck.order(:name)
  end
  def index
    @food_trucks = FoodTruck.order(:name)
  end
end
