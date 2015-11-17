class TwitchStreamSerializer < ApplicationSerializer
  attributes :id, :streamer_name, :avatar, :viewers, :online
end
