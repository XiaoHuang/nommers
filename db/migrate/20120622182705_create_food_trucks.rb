class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string "name"
      t.string "latitude"
      t.string "longitude"
      t.timestamps
    end
  end
end
