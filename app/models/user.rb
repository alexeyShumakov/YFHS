class User < ActiveRecord::Base
  include PgSearch
  has_many :news
  has_many :comments
  has_many :decks

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  pg_search_scope :search_by_nickname, against: [:nickname],
                  using: {tsearch: {prefix: true}}

  before_validation :downcase_fields
  validates :nickname, length: { in: 4..40 }, presence: true, uniqueness: true, format: { with: /\A\w+\Z/ }
  enum role: %w(user moderator admin)

  def downcase_fields
    self.nickname = self.public_nickname.downcase if self.public_nickname.present?
    self.email.downcase! if self.email.present?
  end
end
