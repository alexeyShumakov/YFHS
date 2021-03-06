class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user
  has_reputation :vote, source: :user

  default_scope {order('created_at DESC')}
  paginates_per 15

  def target_name
    commentable.name
  end
end
