class PlayerClass < ActiveRecord::Base
  has_many :cards
  has_many :decks
  has_many :synergies
  validates :name, :en_name, presence: true
end
