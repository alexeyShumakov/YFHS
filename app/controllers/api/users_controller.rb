class Api::UsersController < ApiController
  before_filter :downcase_fields, only: :index

  private
  def downcase_fields
    params[:email].downcase! if params[:email].present?
    params[:nickname].downcase! if params[:nickname].present?
    if params[:filter].present?
      params[:filter][:email].downcase! if params[:filter][:email].present?
      params[:filter][:nickname].downcase! if params[:filter][:nickname].present?
    end
  end
end
