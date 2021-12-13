class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :omniautable

  def self.find_for_facebook_oauth(auth)
      user = User.where(provider: auth.provider, uid: auth.uid).first
      return user if user
      user = User.where(email: auth.info.email).first
      return user if user
      User.create(
      name: auth.extra.raw_info.name,
      provider: auth.provider,
      uid: auth.uid,  
      email: auth.info.email,
      password: Devise.friendly_token[0,20])
  end
  

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :images

  validates :images, blob: {content_type: ['image/jpeg', 'image/jpg', 'image/png'], size_range: 0..3.megabytes}

  ratyrate_rater

end
