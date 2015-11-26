class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  after_filter :user_activity

  protected
  def user_activity
    current_user.try :touch
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
  end

  private

  def user_not_authorized(exception)
    render json: {errors: {auth: ['forbidden']}}, status: :unprocessable_entity
  end
end
