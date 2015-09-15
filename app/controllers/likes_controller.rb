class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]


  def show
    render json: @like
  end

  def new
    @like = Like.new
  end


  # POST /likes
  # POST /likes.json
  def create
    if Like.find_by like_params
      render nothing: true, status: :unprocessable_entity

    else
      @like = Like.new(like_params)

      respond_to do |format|
        if @like.save
          format.json { render json: @like, status: :created }
        else
          format.json { render json: @like.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @like.update(like_params)
        format.json { render json: @like, status: :ok }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.json { head :no_content, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:user_id, :news_id)
    end
end
