class Deck < ActiveRecord::Base
  has_many :builder_cards
end
