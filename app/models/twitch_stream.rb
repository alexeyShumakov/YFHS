class TwitchStream < ActiveRecord::Base
  def self.new(params)
    t_params = Hash.new
    @streamer = Twitch.new.user(params[:streamer_name])
    t_params[:streamer_name] = @streamer[:body]['display_name']
    t_params[:avatar] = @streamer[:body]['logo']
    t_params[:online] = false
    t_params[:viewers] = 0
    super(t_params)
  end
  def self.refresh
    all.each do |stream|
      @stream = Twitch.new.stream(stream.streamer_name)
      if @stream[:body]['stream'].nil?
        stream.viewers = 0
        stream.online = false
      else
        stream.viewers = @stream[:body]['stream']['viewers']
        stream.online = true
      end
      stream.save
    end
  end
end
