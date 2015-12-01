class Api::SynergyResource < JSONAPI::Resource
  attributes :name, :description, :created_at,
             :comments_count, :user_id
end