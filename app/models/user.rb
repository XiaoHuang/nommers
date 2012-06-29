class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :last_location
  has_and_belongs_to_many :favorites, class_name: "FoodTruck"
  
  validates_uniqueness_of :email
end
