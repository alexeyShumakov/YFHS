class Api::NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
    render json: @news
  end

  # GET /news/1
  # GET /news/1.json
  def show
    render json: @single_news
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @single_news = News.new(news_params)

    if @single_news.save
      render json: @single_news, status: :created
    else
      render json: @single_news.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    if @single_news.update(news_params)
      render json: @single_news, status: :ok
    else
      render json: @single_news.errors, status: :unprocessable_entity
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @single_news.destroy
    render json: nil
  end

  private
    def set_news
      @single_news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:name, :body, :user_id)
    end
end
