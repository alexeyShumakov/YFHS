class Api::NewsResource < BaseResource
  attributes :name, :body, :votes, :evaluation_value, :created_at
  has_one :user

  def self.records(options = {})
    params = options[:context][:params]
    @models = params[:page].blank? ? _model_class.page(1) : _model_class.page(params[:page])
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
