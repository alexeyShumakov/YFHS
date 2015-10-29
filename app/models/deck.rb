class Deck < ActiveRecord::Base
  include PgSearch
  has_many :builder_cards, dependent: :destroy
  belongs_to :user
  belongs_to :deck_type
  belongs_to :player_class

  pg_search_scope :search_by_name, against: :name,
                  using: {tsearch: {prefix: true}}

  has_reputation :vote, source: :user
end
