class SynergyCard < ActiveRecord::Base
  belongs_to :synergy
  belongs_to :card
end
