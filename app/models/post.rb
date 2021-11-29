class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :category
  has_one :food_store
end
