class Api::CardsController < ApplicationController
  respond_to :json
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.search_cards(params)
    render json: @cards
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    render json: @card
  end

  # GET /cards/new
  def new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
      if @card.update(card_params)
        render json: @card, status: :ok
      else
        render json: @card.errors, status: :unprocessable_entity
      end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    render json: nil
  end

  def random
    @card = Card.find rand(Card.count)
    render json: @card
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
    params.require(:card).permit(:player_class_str, :name, :card_set, :card_type, :faction, :rarity, :cost, :attack, :health, :text, :flavor, :artist, :collectible, :elite, :img_url, :img_gold_url, :locale)
  end
end

