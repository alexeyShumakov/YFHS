class BuilderCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck
  validates :card, :deck, presence: true
  validates :count, numericality: { only_integer: true }
end
