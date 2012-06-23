# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    
    FoodTruck.delete_all

    require 'open-uri'
    file = open('http://www.findlafoodtrucks.com/apps/map_json.php')
    json = ActiveSupport::JSON.decode(file.read)

    json['markers'].each do |x|
       FoodTruck.create(name: x['print_name'], latitude: x['coord_lat'], longitude: x['coord_long'])
    end
