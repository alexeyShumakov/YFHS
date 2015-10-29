class News < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_reputation :vote, source: :user
end
