class TwitchStream < ActiveRecord::Base
  validates :streamer_name, presence: true
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
