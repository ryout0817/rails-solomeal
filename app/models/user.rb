class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable
  mount_uploader :avatar, AvatarUploader

  has_many :recipes

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :configure_sign_up_params

  def self.guest
    user = User.find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    end
  end
end
