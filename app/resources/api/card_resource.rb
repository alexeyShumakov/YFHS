class Api::CardResource < JSONAPI::Resource
  attributes :votes, :comments_count, :evaluation_value,
             :card_game_id, :name, :card_set, :durability,
             :card_type, :race, :player_class_str, :faction,
             :rarity, :cost, :attack, :health, :text, :flavor,
             :artist, :collectible, :elite, :locale, :mechanics,
             :img_url, :img_gold_url

  def self.records(options = {})
    @models = _model_class.search_cards options[:context][:params]
    options[:context][:total_pages] = @models.total_pages
    @models
  end

  def evaluation_value
    if context[:current_user] && @model.has_evaluation?(:vote, context[:current_user])
      @model.evaluation_by :vote, context[:current_user]
    else
      0
    end
  end

  def votes
    @model.reputation_for :vote
  end

  def img_url

    @model.img.url
  end

  def img_gold_url
    @model.img_gold.url
  end
end