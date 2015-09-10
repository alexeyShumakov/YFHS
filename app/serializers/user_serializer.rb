class UserSerializer < ApplicationSerializer
  attributes :id, :email
  has_many :news
end
