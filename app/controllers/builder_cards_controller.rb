class BuilderCardsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_builder_card, only: [:show, :edit, :update, :destroy]

  # GET /builder_cards
  # GET /builder_cards.json
  def index
    @builder_cards = BuilderCard.where deck_id: params[:deck_id]
    render json: @builder_cards
  end

  # GET /builder_cards/1
  # GET /builder_cards/1.json
  def show
    render json: @builder_card
  end

  # GET /builder_cards/new
  def new
    @builder_card = BuilderCard.new
  end

  # GET /builder_cards/1/edit
  def edit
  end

  # POST /builder_cards
  # POST /builder_cards.json
  def create
    @builder_card = BuilderCard.new(builder_card_params)
    authorize @builder_card

    respond_to do |format|
      if @builder_card.save
        format.json { render json: @builder_card, status: :created }
      else
        format.json { render json: @builder_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builder_cards/1
  # PATCH/PUT /builder_cards/1.json
  def update
    authorize @builder_card
    respond_to do |format|
      if @builder_card.update(builder_card_params)
        format.json { render json: @builder_card, status: :ok }
      else
        format.json { render json: @builder_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builder_cards/1
  # DELETE /builder_cards/1.json
  def destroy
    authorize @builder_card
    @builder_card.destroy
    respond_to do |format|
      format.json { render json: @builder_card, status: :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_builder_card
      @builder_card = BuilderCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def builder_card_params
      params.require(:builder_card).permit(:card_id, :deck_id, :count)
    end
end
