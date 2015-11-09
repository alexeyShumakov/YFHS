class CardSerializer < ApplicationSerializer
  attributes :votes, :comments_count, :evaluation_value,
             :id, :card_game_id, :name, :card_set, :durability,
             :card_type, :race, :player_class_str, :faction,
             :rarity, :cost, :attack, :health, :text, :flavor,
             :artist, :collectible, :elite, :locale, :mechanics,
             :img_url, :img_gold_url

  def evaluation_value
    if scope && object.has_evaluation?(:vote, scope)
      object.evaluation_by :vote, scope
    else
      0
    end
  end

  def votes
    object.reputation_for :vote
  end

  def img_url
    object.img.url
  end

  def img_gold_url
    object.img_gold.url
  end
end
