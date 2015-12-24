class Api::DeckTypeResource < JSONAPI::Resource
  attributes :name
  has_many :decks
end
