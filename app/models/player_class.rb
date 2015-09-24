class PlayerClass < ActiveRecord::Base
  has_many :cards
  has_many :decks
end
