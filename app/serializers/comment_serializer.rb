class CommentSerializer < ApplicationSerializer
  attributes :id, :body, :user_id, :news_id
end
