class DecksController < ApplicationController
  include SearchHelper
  before_action :set_deck, only: [:increase_vote, :decrease_vote, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:increase_vote, :decrease_vote]

  # GET /decks
  # GET /decks.json
  def index
    search_decks

    if user_signed_in?
      @decks.each do |deck|
        update_vote_status deck
      end
    end
    respond_to do |format|
      format.json { render json: @decks, meta: {total: @decks.total_pages} }
      format.html {}
    end
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    if user_signed_in?
      update_vote_status @deck
    end
    render json: @deck
  end

  def search
  end

  # GET /decks/1/increase_vote
  def increase_vote
    @deck.update_vote 1, current_user
    render nothing: true, status: :ok
  end

  # GET /decks/1/decrease_vote
  def decrease_vote
    @deck.update_vote -1, current_user
    render nothing: true, status: :ok

  end

  # GET /decks/new
  def new
    @deck = Deck.new
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  # POST /decks.json
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

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.json { render json: @deck, status: :ok }
      else
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.json { render nothing: true, status: :ok}
    end
  end

  private
    def update_vote_status(deck)
      if deck.has_evaluation? :vote, current_user
        deck.update_vote_status current_user
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:page, :deck_type, :player_class, :player_class_id, :description, :user_id ,:deck_type_id, :name)
    end
end
