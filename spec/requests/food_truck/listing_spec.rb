require 'spec_helper'

describe 'Listing food trucks' do
  context 'given a reference location' do
    before do
      @here = { latitude: 0, longitude: 0 } 
      miles_per_degree = GeoKit::Mappable::MILES_PER_LATITUDE_DEGREE
      less_than_five_miles_from_here = (4.99 / miles_per_degree) + @here[:latitude]
      six_miles_from_here = (6 / miles_per_degree) + @here[:latitude]
      @nearby_truck_count = 6
      @nearby_trucks = FactoryGirl.create_list :food_truck, @nearby_truck_count, latitude: less_than_five_miles_from_here, longitude: @here[:longitude]
      FactoryGirl.create_list :food_truck, 6, latitude: six_miles_from_here, longitude: @here[:longitude]
      visit '/'
      within 'form' do
        fill_in 'Location', with: "#{@here[:latitude]}, #{@here[:longitude]}"
        click_on 'Search'
      end
    end

    it 'lists only food trucks within a 5 mile radius' do
      all('.food-trucks li').should have(@nearby_truck_count).items
      @nearby_trucks.each do |food_truck|
        find('.food-trucks').should have_content(food_truck.name)
      end
    end

    it 'displays the distance in miles' do
      all("span.distance").each do |span|
        near = span.text.to_f <= 5
        near.should be_true
      end
    end
  end
end
