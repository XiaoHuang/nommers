class CreateFoodTrucksUsersJoin < ActiveRecord::Migration
  def up
    create_table :food_trucks_users, :id => false do |t|
      t.integer "user_id"
      t.integer "food_truck_id"
    end
    add_index :food_trucks_users, ["user_id", "food_truck_id"]
  end

  def down
    drop_table :food_trucks_users
  end
end
