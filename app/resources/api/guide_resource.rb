class Api::GuideResource < JSONAPI::Resource
  attributes :name, :body, :created_at, :votes, :comments_count, :evaluation_value
  has_one :guide_category
  filters :id, :guide_category

  def evaluation_value
    if context[:current_user] && @model.has_evaluation?(:vote, context[:current_user])
      @model.evaluation_by :vote, context[:current_user]
    else
      0
    end
  end

  def votes
    @model.reputation_for :vote
  end
end
