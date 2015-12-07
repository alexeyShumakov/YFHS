class Api::UserResource < JSONAPI::Resource
  attributes :email, :nickname, :public_nickname, :updated_at, :role
  filters :email, :nickname

  def self.records(options = {})
    params = options[:context][:params]
    if params[:action] == 'index'
      if params[:nickname].present?
        _model_class.search_by_nickname params[:nickname]
      else
        super options
      end
    else
      super options
    end
  end
end