class ChangeTypeFoodStore < ActiveRecord::Migration[5.2]
  def change
    change_column :food_stores, :latitude, :integer
    change_column :food_stores, :latitude, :float
  end
end

