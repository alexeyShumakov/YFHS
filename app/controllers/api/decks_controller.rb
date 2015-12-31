class Api::DecksController < ApiController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
end

