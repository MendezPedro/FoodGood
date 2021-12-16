class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
  where(email: auth.info.email).first_or_initialize do |user|
    user.user_name = auth.info.name
    user.email = auth.info.email
    user.password = SecureRandom.hex
  end
end
  

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :images

  validates :images, blob: {content_type: ['image/jpeg', 'image/jpg', 'image/png'], size_range: 0..3.megabytes}

  ratyrate_rater

end
