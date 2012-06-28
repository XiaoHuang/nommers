class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :last_location
  
  validates_uniqueness_of :email
end
