class FoodTruckController < ApplicationController
  def details
    @food_trucks = FoodTruck.order(:name)
  end
end
