class FoodTruck < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude
end
