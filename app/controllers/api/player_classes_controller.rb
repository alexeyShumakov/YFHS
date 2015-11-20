class Api::PlayerClassesController < ApplicationController
  before_action :set_player_class, only: [:show, :edit, :update, :destroy]

  # GET /player_classes
  # GET /player_classes.json
  def index
    @player_classes = PlayerClass.all
    render json: @player_classes
  end

  # GET /player_classes/1
  # GET /player_classes/1.json
  def show
    render json: @player_class
  end

  # GET /player_classes/new
  def new
    @player_class = PlayerClass.new
  end

  # GET /player_classes/1/edit
  def edit
  end

  # POST /player_classes
  # POST /player_classes.json
  def create
    @player_class = PlayerClass.new(player_class_params)

      if @player_class.save
        render @player_class, status: :created
      else
        render json: @player_class.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /player_classes/1
  # PATCH/PUT /player_classes/1.json
  def update
    if @player_class.update(player_class_params)
      render @player_class, status: :ok
    else
      render json: @player_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_classes/1
  # DELETE /player_classes/1.json
  def destroy
    @player_class.destroy
    render json: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_class
      @player_class = PlayerClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_class_params
      params.require(:player_class).permit(:name)
    end
end
