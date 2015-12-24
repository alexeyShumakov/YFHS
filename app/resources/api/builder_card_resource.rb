class Api::BuilderCardResource < JSONAPI::Resource
  attributes :count
  has_one :card
  has_one :deck
  def self.records(options = {})
    params = options[:context][:params]
    if params[:action] == 'index'
      @models = _model_class.where deck_id: params[:deck_id]
    else
      super options
    end
  end
end
