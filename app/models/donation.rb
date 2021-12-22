class Donation < ApplicationRecord
    validates :amount, presence: true
    validates :title, presence: true
end
