class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.references :food_store, foreign_key: true
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
