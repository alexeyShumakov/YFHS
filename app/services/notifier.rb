class Notifier
  def self.notify(user_id, hash)
    MessageBus.publish "/users/#{user_id}/event", hash.to_json
  end
end