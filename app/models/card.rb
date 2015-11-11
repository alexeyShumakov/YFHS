class Card < ActiveRecord::Base
  include PgSearch
  has_many :builder_cards
  belongs_to :player_class
  has_many :comments, as: :commentable, dependent: :destroy
  has_reputation :vote, source: :user
  paginates_per 6
  pg_search_scope :search_by_name, against: [:rarity, :card_type, :name, :race, :card_set, :mechanics],
                  using: {tsearch: {prefix: true}}
  def comments_count
    comments.size
  end
  default_scope {order(:cost, :id)}
  has_attached_file :img
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

  has_attached_file :img_gold
  validates_attachment_content_type :img_gold, content_type: /\Aimage\/.*\Z/
end
