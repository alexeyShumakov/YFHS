class DeckSerializer < ApplicationSerializer
  attributes :id, :votes,:user_decrease_vote, :user_increase_vote, :name, :description, :user_id, :deck_type_id, :player_class_id
  has_many :builder_cards
end
