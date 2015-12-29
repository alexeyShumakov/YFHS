class Api::SynergyResource < JSONAPI::Resource
  attributes :name, :description, :created_at, :user_id,
             :comments_count, :evaluation_value, :votes
  has_many :synergy_cards
  has_one :user
  has_one :player_class
  def self.records(options = {})
    params = options[:context][:params]
    if params[:id].present?
      _model_class.where id: params[:id]
    else
      @models = _model_class.search_synergies params
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