class Api::PlayerClassResource < BaseResource
  attributes :name, :en_name
  has_many :decks
  has_many :synergies
end
