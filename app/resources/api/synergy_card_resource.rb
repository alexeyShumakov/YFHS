class Api::SynergyCardResource < JSONAPI::Resource
  has_one :card
  has_one :synergy
end
