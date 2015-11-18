class SynergySerializer < ApplicationSerializer
  attributes :id, :name, :description, :user_id, :player_class_id,
             :created_at, :evaluation_value, :votes, :comments_count, :user_id
  has_many :synergies_cards

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
