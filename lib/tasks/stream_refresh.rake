namespace :twitch_streams do
  task refresh: :environment do
    TwitchStream.refresh
  end
end
