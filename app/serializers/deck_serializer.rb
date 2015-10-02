class DeckSerializer < ApplicationSerializer
  attributes :id, :name, :description, :user_id, :deck_type_id, :player_class_id
  has_many :builder_cards
end
