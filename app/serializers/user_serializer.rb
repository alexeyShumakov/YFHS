class UserSerializer < ApplicationSerializer
  attributes :id, :email
  has_many :decks
  has_many :news
  has_many :comments
  has_many :likes
end
