class NewsSerializer < ApplicationSerializer
  attributes :id, :title, :body, :user_id
end
