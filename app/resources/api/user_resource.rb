class Api::UserResource < JSONAPI::Resource
  attributes :email, :nickname, :public_nickname, :updated_at, :role
  filters :email, :nickname
  def meta(options = {})
    puts @model.to_yaml
  end
end