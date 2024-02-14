class User < ApplicationRecord
  enum role: { general: 0, admin: 1, guest: 2 }
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'ゲストユーザー'
      user.role = 'guest'
    end
  end
end
