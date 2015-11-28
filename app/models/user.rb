class User < ActiveRecord::Base
  has_many :news
  has_many :comments
  has_many :decks

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  before_validation :downcase_fields
  validates :nickname, length: { in: 4..40 }, presence: true, uniqueness: true, format: { with: /\A\w+\Z/ }
  enum role: %w(user moderator admin)

  def downcase_fields
    self.nickname = self.public_nickname.downcase if self.public_nickname.present?
    self.email.downcase! if self.email.present?
  end
end
