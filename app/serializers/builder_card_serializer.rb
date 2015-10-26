class BuilderCardSerializer < ApplicationSerializer
  attributes :id, :count, :deck_id
  has_one :card
end
