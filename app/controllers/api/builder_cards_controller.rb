class Api::BuilderCardsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_builder_card, only: [:show, :edit, :update, :destroy]

  # GET /builder_cards.json
  def index
    @builder_cards = BuilderCard.where(deck_id: params[:deck_id]).includes :card
    render json: @builder_cards
  end

  # GET /builder_cards/1.json
  def show
    render json: @builder_card
  end

  def new
  end

  # GET /builder_cards/1/edit
  def edit
  end

  # POST /builder_cards.json
  def create
    @builder_card = BuilderCard.new(builder_card_params)
    authorize @builder_card

    if @builder_card.save
      render json: @builder_card, status: :created
    else
      render json: @builder_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /builder_cards/1.json
  def update
    authorize @builder_card
      if @builder_card.update(builder_card_params)
        render json: @builder_card, status: :ok
      else
        render json: @builder_card.errors, status: :unprocessable_entity
      end
  end

  # DELETE /builder_cards/1.json
  def destroy
    authorize @builder_card
    @builder_card.destroy
    render json: nil
  end

  private
  def set_builder_card
    @builder_card = BuilderCard.find(params[:id])
  end

  def builder_card_params
    params.require(:builder_card).permit(:card_id, :deck_id, :count)
  end
end

