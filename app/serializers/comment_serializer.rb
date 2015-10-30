class CommentSerializer < ApplicationSerializer
  attributes :id, :body, :commentable_id, :commentable_type
end
