class Guide < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  attr_readonly :comments_count
  has_reputation :vote, source: :user

  belongs_to :guide_category
end
