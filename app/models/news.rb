class News < ActiveRecord::Base
  belongs_to :user
  attr_readonly :comments_count
  has_many :comments, as: :commentable, dependent: :destroy
  has_reputation :vote, source: :user
  default_scope {order('created_at DESC')}
end
