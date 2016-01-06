class SynergyCard < ActiveRecord::Base
  belongs_to :synergy
  belongs_to :card
  validates :synergy, :deck, presence: true
end
