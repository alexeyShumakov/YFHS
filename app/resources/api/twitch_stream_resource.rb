class Api::TwitchStreamResource < JSONAPI::Resource
  attributes :streamer_name, :avatar, :viewers, :online

  def self.records(options = {})
    _model_class.where(online: true).order( viewers: 'desc')
  end
end