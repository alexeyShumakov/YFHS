class Deck < ActiveRecord::Base
  has_many :builder_cards, dependent: :destroy
  belongs_to :user
  belongs_to :deck_type
  belongs_to :player_class
end
