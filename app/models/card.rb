class Card < ActiveRecord::Base
  include PgSearch
  has_many :builder_cards
  belongs_to :player_class
  attr_readonly :comments_count
  has_many :comments, as: :commentable, dependent: :destroy
  has_reputation :vote, source: :user
  paginates_per 6
  pg_search_scope :search_by_name, against: [:name], using: {tsearch: {prefix: true}}
  pg_search_scope :search_by_params, against: [:rarity, :card_type, :name, :race, :card_set, :mechanics],
                  using: {tsearch: {prefix: true}}
  def comments_count
    comments.size
  end
  has_attached_file :img
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

  has_attached_file :img_gold
  validates_attachment_content_type :img_gold, content_type: /\Aimage\/.*\Z/

  def self.search_cards(params)
    if params[:limit].present?
      @cards = VoteService.most_voted(:card).limit(params[:limit]).page(1).per(5)
    else
      @cards = all.where.not(card_type: 'Hero').order(:cost, :id)
      @cards = @cards.search_by_name(params[:name]) if params[:name].present?
      @cards = @cards.search_by_params(params[:keyword]) if params[:keyword].present?
      @cards = @cards.where(player_class_str: [params[:current_player_class], nil]) if params[:current_player_class].present?
      if params[:player_class].present?
        @cards = params[:player_class] == 'Neutral' ? @cards.where(player_class_str: nil) : @cards.where(player_class_str: params[:player_class])
      end
      if params[:cost].present?
        @cards = params[:cost].to_i >= 7 ? @cards.where('cost >= 7') : @cards.where(cost: params[:cost])
      end
      @cards = params[:page].present? ? @cards.page(params[:page]) : @cards.page(1)

    end
  end
end
