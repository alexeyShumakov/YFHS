class UserSerializer < ApplicationSerializer
  attributes :id, :email
  has_many :news
  has_many :comments
end
