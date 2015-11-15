class UsersController < ApplicationController
  def get_current_user
    if user_signed_in?
      usr_params = { user: {
          id: current_user.id,
          email: current_user.email,
          nickname: current_user.nickname
      }
      }
      render json: usr_params
    else
      render nothing: true, status: 404
    end
  end

  def show
    respond_to do |format|
      format.json { render json: User.find(params['id']) }
      format.html {}
    end
  end
  def decks
  end
  def comments
  end
  def synergies
  end
end
