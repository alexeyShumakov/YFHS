class Api::DeckResource < BaseResource
  attributes :votes, :comments_count, :curve, :evaluation_value, :name,
             :description, :created_at, :user_id, :deck_type_id, :player_class_id
  has_many :builder_cards
  has_one :user
  has_one :deck_type
  has_one :player_class

  def self.records(options = {})
    params = options[:context][:params]
    if params[:id].present?
      _model_class.where id: params[:id]
    else
      @models = _model_class.search_decks options[:context][:params]
      options[:context][:total_pages] = @models.total_pages
      @models
    end
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