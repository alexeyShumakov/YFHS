class Synergy < ActiveRecord::Base
  include PgSearch
  has_many :synergies_cards, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  belongs_to :player_class
  paginates_per 15
  has_reputation :vote, source: :user
  pg_search_scope :search_by_name, against: :name,
                  using: {tsearch: {prefix: true}}
  def self.search_synergies(params)
    @synergies = VoteService.most_voted :synergy
    @synergies = @synergies.search_by_name(params[:name]) if params[:name].present?
    @synergies = @synergies.where player_class: (PlayerClass.find_by en_name: params[:player_class]) if params[:player_class].present?
    @synergies = @synergies.where user_id: params[:user_id] if params[:user_id].present?
    if params[:page].to_i == -1
      @synergies = @synergies.page(1).per(Deck.count)
    else
      @synergies = params[:page].blank? ? @synergies.page(1) : @synergies.page(params[:page])
    end
    @synergies = params[:limit].blank? ? @synergies : @synergies.limit(params[:limit].to_i)
  end
  def comments_count
    comments.size
  end
end
