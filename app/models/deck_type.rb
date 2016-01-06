class DeckType < ActiveRecord::Base
  has_many :decks
  validates :name, presence: true
end
