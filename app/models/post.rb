class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :food_store
end
