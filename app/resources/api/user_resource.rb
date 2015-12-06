class Api::UserResource < JSONAPI::Resource
  attributes :email, :nickname, :public_nickname, :updated_at, :role
  filters :email, :nickname
end