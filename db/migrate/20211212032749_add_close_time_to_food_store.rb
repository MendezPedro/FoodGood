class AddCloseTimeToFoodStore < ActiveRecord::Migration[5.2]
  def change
    add_column :food_stores, :closing, :time
  end
end
