class Api::TwitchStreamsController < ApplicationController
  before_action :set_twitch_stream, only: [:show, :edit, :update, :destroy]

  # GET /twitch_streams.json
  def index
    @twitch_streams = TwitchStream.where(online: true).order( viewers: 'desc')
    render json: @twitch_streams
  end

  # GET /twitch_streams/1.json
  def show
  end

  # GET /twitch_streams/new
  def new
  end

  # GET /twitch_streams/1/edit
  def edit
  end

  # POST /twitch_streams.json
  def create
    @twitch_stream = TwitchStream.new(twitch_stream_params)
    if @twitch_stream.save
      render json: @twitch_stream
    else
      render json: @twitch_stream.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /twitch_streams/1.json
  def update
    if @twitch_stream.update(twitch_stream_params)
      render json: @twitch_stream
    else
      render json: @twitch_stream.errors, status: :unprocessable_entity
    end
  end

  # DELETE /twitch_streams/1.json
  def destroy
    @twitch_stream.destroy
    render json: nil
  end

  private
  def set_twitch_stream
    @twitch_stream = TwitchStream.find(params[:id])
  end

  def twitch_stream_params
    params.require(:twitch_stream).permit(:streamer_name)
  end
end

