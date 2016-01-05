class User < ActiveRecord::Base
  acts_as_token_authenticatable
  include PgSearch
  has_many :news
  has_many :comments
  has_many :decks
  has_many :synergies

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable

  pg_search_scope :search_by_nickname, against: [:nickname],
                  using: {tsearch: {prefix: true}}

  before_validation :downcase_fields
  validates :nickname, length: { in: 4..40 }, presence: true, uniqueness: true, format: { with: /\A\w+\Z/ }
  validates :public_nickname, length: { in: 4..40 }, presence: true, uniqueness: true, format: { with: /\A\w+\Z/ }
  enum role: %w(user moderator admin)

  def downcase_fields
    self.nickname = self.public_nickname.downcase if self.public_nickname.present?
    self.email.downcase! if self.email.present?
  end
end
