class Category < ApplicationRecord
  validates :title, presence: true
  has_many :sub_categories, class_name: "Category", foreign_key: "category_id", dependent: :destroy
  belongs_to :main_category, class_name: "Category", foreign_key: "category_id", optional: true
  has_many :posts
end
