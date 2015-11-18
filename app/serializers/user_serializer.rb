class UserSerializer < ApplicationSerializer
  attributes :id, :email, :nickname, :updated_at, :role
end
