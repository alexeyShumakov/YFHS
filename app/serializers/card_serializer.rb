class CardSerializer < ApplicationSerializer
  attributes :id, :player_class_str, :card_game_id, :name, :card_set, :card_type, :faction, :rarity, :cost, :attack, :health, :text, :flavor, :artist, :collectible, :elite, :img_url, :img_gold_url, :locale

  def img_url
    object.img.url
  end

  def img_gold_url
    object.img_gold.url
  end
end
