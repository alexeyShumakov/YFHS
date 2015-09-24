class DeckTypeSerializer < ApplicationSerializer
  attributes :id, :name
  has_many :deck
end
