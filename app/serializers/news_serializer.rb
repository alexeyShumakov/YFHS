class NewsSerializer < ApplicationSerializer
  attributes :id, :title, :body, :user_id, :evaluation_value, :votes

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
