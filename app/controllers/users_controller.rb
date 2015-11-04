class UsersController < ApplicationController
  def get_current_user
    usr_params = { user: {
        id: current_user.id,
        email: current_user.email,
        nickname: current_user.nickname
      }
    }
    if user_signed_in?
      render json: usr_params
    else
      render nothing: true, status: 404
    end
  end

  def show
    render json: User.find(params['id'])
  end
end
