class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_models

  def increase
    @vote_service.update_vote 1, current_user
    send_notification
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

  def send_notification
    unless current_user == @model.user
      if @model.instance_of? Deck
        Notifier.notify @model.user.id, get_hash('колода')
      elsif @model.instance_of? Synergy
        Notifier.notify @model.user.id, get_hash('синергия')
      end
    end
  end

  def get_hash(name)
    {
      publicNickname: current_user.public_nickname,
      text: "понравилась ваша #{name}",
      entity: {
        route: @model.class.name.downcase,
        id: @model.id,
        name: @model.name
      }
    }
  end
end
