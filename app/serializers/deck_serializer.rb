class DeckSerializer < ApplicationSerializer
  attributes :id, :votes, :evaluation_value, :name, :description, :created_at, :user_id, :deck_type_id, :player_class_id
  has_many :builder_cards

  def evaluation_value
    if scope && object.has_evaluation?(:vote, scope)
      object.evaluation_by :vote, scope
    else
      0
    end
  end

  def votes
    object.reputation_for :vote
  end
end
