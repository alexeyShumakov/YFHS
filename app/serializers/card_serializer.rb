class CardSerializer < ApplicationSerializer
  attributes :id, :votes, :comments_count, :evaluation_value, :player_class_str, :name, :card_set, :card_type, :rarity, :cost, :attack, :health, :img_url, :img_gold_url

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
