class Api::SynergiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_synergy, only: [:show, :edit, :update, :destroy]

  # GET /synergies
  # GET /synergies.json
  def index
    @synergies = Synergy.search_synergies(params)
    render json: @synergies, meta: {total: @synergies.total_pages}
  end

  def search
  end

  # GET /synergies/1
  # GET /synergies/1.json
  def show
    render json: @synergy
  end

  # GET /synergies/new
  def new
    @synergy = Synergy.new
  end

  # GET /synergies/1/edit
  def edit
  end

  # POST /synergies
  # POST /synergies.json
  def create
    @synergy = Synergy.new(synergy_params)

    if @synergy.save
      render json: @synergy, status: :created
    else
      render json: @synergy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /synergies/1
  # PATCH/PUT /synergies/1.json
  def update
    authorize @synergy
    if @synergy.update(synergy_params)
      render json: @synergy, status: :ok
    else
      render json: @synergy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /synergies/1
  # DELETE /synergies/1.json
  def destroy
    authorize @synergy
    @synergy.destroy
    render json: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synergy
      @synergy = Synergy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synergy_params
      params.require(:synergy).permit(:name, :description, :user_id, :player_class_id)
    end
end
