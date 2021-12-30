class FoodStore < ApplicationRecord
    has_one :post

    has_many_attached :photographics

    validates :photographics, blob: {content_type: ['image/jpeg', 'image/jpg', 'image/png'], size_range: 0..3.megabytes}
    validates :address, presence: true
    validates :products, presence: true
    validates :name, presence: true

    
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

end
