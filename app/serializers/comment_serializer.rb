class CommentSerializer < ApplicationSerializer
  attributes :id, :votes, :target_name, :evaluation_value, :body, :commentable_id, :commentable_type, :created_at
  has_one :user
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
