class Api::SynergiesCardsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_synergies_card, only: [:show, :edit, :update, :destroy]

  # GET /synergies_cards
  # GET /synergies_cards.json
  def index
    @synergies_cards = SynergiesCard.all
    render json: @synergies_card
  end

  # GET /synergies_cards/1
  # GET /synergies_cards/1.json
  def show
    render json: @synergies_card
  end

  # GET /synergies_cards/new
  def new
    @synergies_card = SynergiesCard.new
  end

  # GET /synergies_cards/1/edit
  def edit
  end

  # POST /synergies_cards
  # POST /synergies_cards.json
  def create
    @synergies_card = SynergiesCard.new(synergies_card_params)
    authorize @synergies_card
    if @synergies_card.save
      render json: @synergies_card, status: :created
    else
      render json: @synergies_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /synergies_cards/1
  # PATCH/PUT /synergies_cards/1.json
  def update
    authorize @synergies_card
    if @synergies_card.update(synergies_card_params)
      render json: @synergies_card, status: :ok
    else
      render json: @synergies_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /synergies_cards/1
  # DELETE /synergies_cards/1.json
  def destroy
    authorize @synergies_card
    @synergies_card.destroy
    render json: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synergies_card
      @synergies_card = SynergiesCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synergies_card_params
      params.require(:synergies_card).permit(:card_id, :synergy_id)
    end
end
