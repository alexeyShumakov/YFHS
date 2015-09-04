class UsersController < ApplicationController
  def get_current_user
    if user_signed_in?
      render json: current_user
    else
      render nothing: true, status: 404
    end
  end
end
