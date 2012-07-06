FactoryGirl.define do
  factory :food_truck do
    sequence(:name) { |n| "Name #{n}" }
  end
end
