class TwitchStreamsController < ApplicationController
  before_action :set_twitch_stream, only: [:show, :edit, :update, :destroy]

  # GET /twitch_streams
  # GET /twitch_streams.json
  def index
    @twitch_streams = TwitchStream.where(online: true).order( viewers: 'desc')
    render json: @twitch_streams
  end

  # GET /twitch_streams/1
  # GET /twitch_streams/1.json
  def show
  end

  # GET /twitch_streams/new
  def new
  end

  # GET /twitch_streams/1/edit
  def edit
  end

  # POST /twitch_streams
  # POST /twitch_streams.json
  def create
    @twitch_stream = TwitchStream.new(twitch_stream_params)

    respond_to do |format|
      if @twitch_stream.save
        format.json { render json: @twitch_stream}
      else
        format.json { render json: @twitch_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitch_streams/1
  # PATCH/PUT /twitch_streams/1.json
  def update
    respond_to do |format|
      if @twitch_stream.update(twitch_stream_params)
        format.json { render json: @twitch_stream }
      else
        format.json { render json: @twitch_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitch_streams/1
  # DELETE /twitch_streams/1.json
  def destroy
    @twitch_stream.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitch_stream
      @twitch_stream = TwitchStream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitch_stream_params
      params.require(:twitch_stream).permit(:streamer_name)
    end
end
