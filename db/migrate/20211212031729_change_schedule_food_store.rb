class ChangeScheduleFoodStore < ActiveRecord::Migration[5.2]
  def change
    change_column :food_stores, :schedule, :datetime
    change_column :food_stores, :schedule, :time
  end
end
