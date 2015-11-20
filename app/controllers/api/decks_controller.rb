class Api::DecksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = Deck.search_decks(params)

    render json: @decks, meta: {total: @decks.total_pages}
  end

  def show
     render json: @deck
  end

  def search
  end

  def new
  end

  def edit
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      render json: @deck, status: :created
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @deck
    if @deck.update(deck_params)
      render json: @deck, status: :ok
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @deck
    @deck.destroy
    render json: nil
  end

  private
  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:page, :deck_type, :player_class, :player_class_id, :description, :user_id ,:deck_type_id, :name)
  end
end

