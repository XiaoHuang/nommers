class AddAddress < ActiveRecord::Migration
  def up
    add_column("food_trucks", "address", :string, :length=> 50)
  end

  def down
    remove_column("food_trucks", "address")
  end
end
