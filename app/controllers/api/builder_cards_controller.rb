class Api::BuilderCardsController < ApiController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
end

