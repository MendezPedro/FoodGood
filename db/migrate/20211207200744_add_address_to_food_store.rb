class AddAddressToFoodStore < ActiveRecord::Migration[5.2]
  def change
    add_column :food_stores, :address, :string
  end
end
