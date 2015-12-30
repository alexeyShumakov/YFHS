class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  acts_as_token_authentication_handler_for User, fallback: :none
  respond_to :json, :html
  # protect_from_forgery with: :null_session
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_filter :user_activity
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def user_activity
    current_user.try :touch
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :public_nickname
  end

  private

  def user_not_authorized(exception)
    render json: {errors: {auth: ['forbidden']}}, status: :unprocessable_entity
  end
end
