class Api::CardResource < JSONAPI::Resource
  attributes :votes, :comments_count, :evaluation_value,
             :card_game_id, :name, :card_set, :durability,
             :card_type, :race, :player_class_str, :faction,
             :rarity, :cost, :attack, :health, :text, :flavor,
             :artist, :collectible, :elite, :locale, :mechanics,
             :img_url, :img_gold_url

  # def self.records(options = {})
  #   @params = options[:context][:params]
  #
  #   if @params[:limit].present?
  #     @cards = VoteService.most_voted(:card).limit(@params[:limit]).page(1).per(5)
  #   else
  #     @cards = Card.all.where.not(card_type: 'Hero').order(:cost, :id)
  #     @cards = @cards.search_by_params(@params[:keyword]) if @params[:keyword].present?
  #     @cards = @cards.where(player_class_str: [@params[:current_player_class], nil]) if @params[:current_player_class].present?
  #     if @params[:player_class].present?
  #       @cards = @params[:player_class] == 'Neutral' ? @cards.where(player_class_str: nil) : @cards.where(player_class_str: @params[:player_class])
  #     end
  #     if @params[:cost].present?
  #       @cards = @params[:cost].to_i >= 7 ? @cards.where('cost >= 7') : @cards.where(cost: @params[:cost])
  #     end
  #     @cards
  #   end
  # end

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