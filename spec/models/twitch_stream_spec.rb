require 'rails_helper'

RSpec.describe TwitchStream, type: :model do

  it 'refresh stream(streamer offline)' do
    create(:twitch_stream)
    stub_request(:get, "https://api.twitch.tv/kraken/streams/Streamer").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => nil, :headers => {})
    TwitchStream.refresh
    expect(TwitchStream.first.online).to eq(false)
  end

  it 'refresh stream(streamer online)' do
    create(:twitch_stream, online: false)
    body = '{ "stream": { "viewers": 2123 } }'

    stub_request(:get, "https://api.twitch.tv/kraken/streams/Streamer").
        with(:headers => {
                 'Accept'=>'*/*',
                 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                 'User-Agent'=>'Ruby',
             }). to_return(:status => 200, :body => body.to_json, :headers => {})
    TwitchStream.refresh
    expect(TwitchStream.first.online).to eq(true)
  end

  it 'presence streamer name' do
    stream = build(:twitch_stream, streamer_name: '')
    stream.valid?
    expect(stream.errors[:streamer_name].size).to eq(1)
  end
end
