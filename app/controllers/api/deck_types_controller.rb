class Api::DeckTypesController < ApplicationController
  before_action :set_deck_type, only: [:show, :edit, :update, :destroy]

  # GET /deck_types
  # GET /deck_types.json
  def index
    @deck_types = DeckType.all
    render json: @deck_types
  end

  # GET /deck_types/1
  # GET /deck_types/1.json
  def show
    render json: @deck_type
  end

  # GET /deck_types/new
  def new
    @deck_type = DeckType.new
  end

  # GET /deck_types/1/edit
  def edit
  end

  # POST /deck_types
  # POST /deck_types.json
  def create
    @deck_type = DeckType.new(deck_type_params)

    if @deck_type.save
      render json: @deck_type, status: :created
    else
      render json: @deck_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deck_types/1
  # PATCH/PUT /deck_types/1.json
  def update
    if @deck_type.update(deck_type_params)
      render json: @deck_type, status: :ok
    else
      render json: @deck_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deck_types/1
  # DELETE /deck_types/1.json
  def destroy
    @deck_type.destroy
    render json: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck_type
      @deck_type = DeckType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_type_params
      params.require(:deck_type).permit(:name)
    end
end
