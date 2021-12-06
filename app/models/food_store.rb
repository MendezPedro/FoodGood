class FoodStore < ApplicationRecord
    has_one :post

    has_many_attached :photographics

    validates :photographics, presence: true, blob: {content_type: ['image/jpeg', 'image/jpg', 'image/png'], size_range: 0..3.megabytes}
end
