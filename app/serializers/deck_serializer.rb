class DeckSerializer < ApplicationSerializer
  attributes :id, :name, :type
  has_many :cards
end
