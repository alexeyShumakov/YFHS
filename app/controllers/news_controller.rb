class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
    respond_to do  |format|
      format.html {render :index}
      format.json {render json: @news}
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json {render json: @single_news}
    end
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

    respond_to do |format|
      if @single_news.save
        format.json { render json: @single_news, status: :created }
      else
        format.json { render json: @single_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @single_news.update(news_params)
        format.json { render json: @single_news, status: :ok }
      else
        format.json { render json: @single_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @single_news.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @single_news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :body, :user_id)
    end
end
