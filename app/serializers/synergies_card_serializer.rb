class SynergiesCardSerializer < ApplicationSerializer
  attributes :id, :synergy_id
  has_one :card
end
