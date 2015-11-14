class SynergiesCard < ActiveRecord::Base
  belongs_to :synergy
  belongs_to :card
end
