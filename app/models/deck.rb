class Deck < ActiveRecord::Base
  has_many :builder_cards, dependent: :destroy
  belongs_to :deck_type
end
