class DecksController < ApplicationController
  include SearchHelper
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    search_decks :deck

    @decks.each do |deck|
      VoteService.new(deck).set_vote_status current_user
    end
    respond_to do |format|
      format.json { render json: @decks, meta: {total: @decks.total_pages} }
      format.html {}
    end
  end

  def show
    VoteService.new(@deck).set_vote_status current_user
    respond_to do |format|
      format.json { render json: @deck }
      format.html {}
    end
  end

  def search
  end

  def new
    @deck = Deck.new
  end

  def edit
  end

  def create
    @deck = Deck.new(deck_params)

    respond_to do |format|
      if @deck.save
        format.json { render json: @deck, status: :created}
      else
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.json { render json: @deck, status: :ok }
      else
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deck.destroy
    respond_to do |format|
      format.json { render nothing: true, status: :ok}
    end
  end

  private
    def set_deck
      @deck = Deck.find(params[:id])
    end

    def deck_params
      params.require(:deck).permit(:page, :deck_type, :player_class, :player_class_id, :description, :user_id ,:deck_type_id, :name)
    end
end
