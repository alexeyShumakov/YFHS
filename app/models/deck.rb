class Deck < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_name, against: :name,
                  using: {tsearch: {prefix: true}}
  has_many :builder_cards, dependent: :destroy
  belongs_to :user
  belongs_to :deck_type
  belongs_to :player_class
end
