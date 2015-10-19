class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  # GET /decks
  # GET /decks.json
  def index
    @decks = Deck.all
    unless params[:name].blank?
      @decks = Deck.search_by_name params[:name]
    end
    unless params[:player_class].blank?
      @player_class = PlayerClass.find_by en_name: params[:player_class]
      @decks = @decks.where player_class: @player_class
    end

    unless params[:deck_type].blank?
      @deck_type = DeckType.find_by name: params[:deck_type]
      @decks = @decks.where(deck_type: @deck_type)
    end
    respond_to do |format|
      format.json { render json: @decks }
      format.html {}
    end
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    render json: @deck
  end

  def search

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
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:deck_type, :player_class, :player_class_id, :description, :user_id ,:deck_type_id, :name, :builder_card_ids => [])
    end
end
