class AddProductsToFoodStore < ActiveRecord::Migration[5.2]
  def change
    add_column :food_stores, :products, :string
  end
end
