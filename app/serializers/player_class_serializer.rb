class PlayerClassSerializer < ApplicationSerializer
  attributes :id, :name
  has_many :cards
end
