class DeckSerializer < ApplicationSerializer
  attributes :id, :name, :deck_type_id
  has_many :builder_cards
end
