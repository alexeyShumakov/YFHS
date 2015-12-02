class Api::DeckResource < JSONAPI::Resource
  attributes :votes, :comments_count, :curve, :evaluation_value, :name,
             :description, :created_at, :user_id, :deck_type_id, :player_class_id

  def self.records(options = {})
    @models = _model_class.search_decks options[:context][:params]
    options[:context][:total_pages] = @models.total_pages
    @models
  end

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