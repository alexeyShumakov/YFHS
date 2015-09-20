class PlayerClassSerializer < ApplicationSerializer
  attributes :id, :name, :en_name
  has_many :cards
end
