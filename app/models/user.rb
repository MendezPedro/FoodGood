class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  #has_one_attached :avatar
  has_one_attached :images

  validates :images, presence: true, blob: {content_type: ['image/jpeg', 'image/jpg', 'image/png'], size_range: 0..3.megabytes}

  ratyrate_rater

end
