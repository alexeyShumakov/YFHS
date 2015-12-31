class Api::DeckTypeResource < BaseResource
  attributes :name
  has_many :decks
end
