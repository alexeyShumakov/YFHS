class User < ActiveRecord::Base
  has_many :news
  has_many :comments
  has_many :decks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable , :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, length: { in: 5..40 }, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  enum role: %w(user moderator admin)
end
