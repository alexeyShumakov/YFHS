class BaseResource < JSONAPI::Resource
  include Pundit
  abstract

  before_remove :auth_remove
  before_update :auth_update
  before_save   :auth_save

  def current_user
    context[:current_user]
  end

  def auth_save
    authorize @model, :save? if current_user.present?
  end

  def auth_remove
    authorize @model, :destroy? if current_user.present?
  end
  def auth_update
    authorize @model, :update? if current_user.present?
  end
end
