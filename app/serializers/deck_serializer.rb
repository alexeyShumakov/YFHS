class DeckSerializer < ApplicationSerializer
  attributes :id, :name, :deck_type
  has_many :builder_cards
end
