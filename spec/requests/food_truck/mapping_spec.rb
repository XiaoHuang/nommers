require 'spec_helper'

describe 'Mapping food trucks' , js: true do
  before do
    here = { latitude: 0, longitude: 0 }
    FactoryGirl.create_list :food_truck, 6, here
    visit root_path
    within 'form' do
      fill_in 'Location', with: "#{here[:latitude]}, #{here[:longitude]}"
      click_on 'Search'
    end
  end

  it 'displays a google map' do
   find('#map_canvas').should have_content('Loading...')
  end
  
  it 'displays a marker for each listed food truck' do

  end
end
