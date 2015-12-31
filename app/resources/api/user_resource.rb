class Api::UserResource < BaseResource
  attributes :email, :nickname, :public_nickname, :updated_at, :role
  filters :email, :nickname
  has_many :decks
  has_many :synergies

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