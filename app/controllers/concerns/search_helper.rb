module SearchHelper
  extend ActiveSupport::Concern
  def search_decks
    @decks = Deck.most_voted
    @decks = @decks.search_by_name(params[:name]) unless params[:name].blank?
    unless params[:player_class].blank?
      @player_class = PlayerClass.find_by en_name: params[:player_class]
      @decks = @decks.where player_class: @player_class
    end

    unless params[:deck_type].blank?
      @deck_type = DeckType.find_by name: params[:deck_type]
      @decks = @decks.where deck_type: @deck_type
    end
    @decks = params[:page].blank? ? @decks.page(1) : @decks.page(params[:page])

  end
end