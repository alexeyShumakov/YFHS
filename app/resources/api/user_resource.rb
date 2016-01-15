class Api::UserResource < BaseResource
  attributes :email, :nickname, :public_nickname, :updated_at, :role
  filters :email, :nickname
  has_many :decks
  has_many :synergies
  has_many :owner_dialogs, foreign_key: 'owner_id', class_name: 'Dialog'
  has_many :company_dialogs, foreign_key: 'company_id', class_name: 'Dialog'

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