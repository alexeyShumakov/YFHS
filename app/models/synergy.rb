class Synergy < ActiveRecord::Base
  has_many :synergies_cards, dependent: :destroy
  belongs_to :user
end
