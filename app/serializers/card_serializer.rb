class CardSerializer < ApplicationSerializer
  attributes :id, :card_id, :name, :card_set, :type, :faction, :rarity, :cost, :attack, :health, :text, :flavor, :artist, :collectible, :elite, :img_id, :img_gold_id, :locale, :mechanics
end
