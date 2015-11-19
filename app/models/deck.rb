class Deck < ActiveRecord::Base
  include PgSearch
  has_many :builder_cards, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  attr_readonly :comments_count
  belongs_to :user
  belongs_to :deck_type
  belongs_to :player_class

  before_save :set_curve
  before_update :set_curve

  pg_search_scope :search_by_name, against: :name,
                  using: {tsearch: {prefix: true}}

  has_reputation :vote, source: :user
  paginates_per 20
  def self.search_decks(params)
    @decks = VoteService.most_voted :deck
    @decks = @decks.search_by_name(params[:name]) if params[:name].present?
    @decks = @decks.where player_class: (PlayerClass.find_by en_name: params[:player_class]) if params[:player_class].present?
    @decks = @decks.where deck_type: (DeckType.find_by name: params[:deck_type]) if params[:deck_type].present?
    @decks = @decks.where user_id: params[:user_id] if params[:user_id].present?
    if params[:page].to_i == -1
      @decks = @decks.page(1).per(Deck.count)
    else
      @decks = params[:page].blank? ? @decks.page(1) : @decks.page(params[:page])
    end
    @decks = params[:limit].blank? ? @decks : @decks.limit(params[:limit].to_i)
  end

  def comments_count
    comments.size
  end
  def set_curve
    curve_arr = []
    0.upto(7).each do |cost|
      curve_arr << cards_count_by_cost(cost)
    end
    items = set_items curve_arr
    self.curve = {items: items}.to_json
  end
  private
    def set_items(curve_arr)
      items = []
      unit_size = get_unit_size curve_arr.max
      curve_arr.each_with_index do |value, index|
         items << { title: index >= 7 ? '7+' : index, value: value, size: value * unit_size }
      end
      items
    end
    def cards_count_by_cost (cost)
      cards = builder_cards.includes(:card).select {|c| cost >= 7 ? c.card.cost >= cost : c.card.cost == cost}
      cards.sum &:count
    end
    def get_unit_size(max_count)
      max_count <= 8 ? 12.5 : 100.0/max_count
    end
end
