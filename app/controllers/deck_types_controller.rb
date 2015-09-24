class DeckTypesController < ApplicationController
  before_action :set_deck_type, only: [:show, :edit, :update, :destroy]

  # GET /deck_types
  # GET /deck_types.json
  def index
    @deck_types = DeckType.all
    respond_to do |format|
      format.json { render json: @deck_types}
      format.json {}
    end
  end

  # GET /deck_types/1
  # GET /deck_types/1.json
  def show
    respond_to do |format|
      format.json { render json: @deck_type}
      format.json {}
    end
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

    respond_to do |format|
      if @deck_type.save
        format.json { render json: @deck_type, status: :created }
      else
        format.json { render json: @deck_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deck_types/1
  # PATCH/PUT /deck_types/1.json
  def update
    respond_to do |format|
      if @deck_type.update(deck_type_params)
        format.json { render json: @deck_type, status: :ok, location: @deck_type }
      else
        format.json { render json: @deck_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deck_types/1
  # DELETE /deck_types/1.json
  def destroy
    @deck_type.destroy
    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
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
