class Api::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    if params[:user_id].present?
      @comments = Comment.includes(:commentable, :user).where user_id: params[:user_id]
    else
      @comments = Comment.includes(:commentable, :user).where commentable_type: params[:commentable_type], commentable_id: params[:commentable_id]
    end
    @comments = params[:page].blank? ? @comments.page(1) : @comments.page(params[:page])
    render json: @comments, meta: {total: @comments.total_pages}
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    render json: @comment
  end

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    render json: nil
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:user_id, :news_id, :body, :commentable_id, :commentable_type)
  end
end

