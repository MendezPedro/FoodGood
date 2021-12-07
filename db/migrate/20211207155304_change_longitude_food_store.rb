class ChangeLongitudeFoodStore < ActiveRecord::Migration[5.2]
  def change
    change_column :food_stores, :longitude, :integer
    change_column :food_stores, :longitude, :float
  end
end
