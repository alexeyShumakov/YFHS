class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_models

  def increase
    @vote_service.update_vote 1, current_user
    render nothing: true, status: :ok
  end

  def decrease
    @vote_service.update_vote -1, current_user
    render nothing: true, status: :ok
  end

  private

  def set_models
    @model = params[:object].capitalize.constantize.find params[:id]
    @vote_service = VoteService.new @model
  end

end
