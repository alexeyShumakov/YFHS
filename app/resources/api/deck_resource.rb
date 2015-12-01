class Api::DeckResource < JSONAPI::Resource
  attributes :name, :description, :created_at, :curve,
             :comments_count, :user_id
end