class AddHandleToFoodTruck < ActiveRecord::Migration
  def change
    add_column :food_trucks, :handle, :string
  end
end
