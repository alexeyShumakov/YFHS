class User < ActiveRecord::Base
  has_many :news
  has_many :comments
  has_many :decks

  validates :nickname, length: { in: 5..40 }, presence: true, uniqueness: true, format: { with: /\A\w+\Z/ }
  enum role: %w(user moderator admin)

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
