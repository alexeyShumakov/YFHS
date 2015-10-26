class CardSerializer < ApplicationSerializer
  attributes :id, :player_class_str, :name, :card_set, :card_type, :rarity, :cost, :attack, :health, :img_url, :img_gold_url

  def img_url
    object.img.url
  end

  def img_gold_url
    object.img_gold.url
  end
end
