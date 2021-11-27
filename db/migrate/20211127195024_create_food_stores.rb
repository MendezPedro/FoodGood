class CreateFoodStores < ActiveRecord::Migration[5.2]
  def change
    create_table :food_stores do |t|
      t.string :name
      t.integer :latitude
      t.integer :longitude
      t.date :day_open
      t.datetime :schedule
      t.string :photo

      t.timestamps
    end
  end
end
