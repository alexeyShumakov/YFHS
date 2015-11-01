class Deck < ActiveRecord::Base
  include PgSearch
  has_many :builder_cards, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  belongs_to :deck_type
  belongs_to :player_class

  pg_search_scope :search_by_name, against: :name,
                  using: {tsearch: {prefix: true}}

  has_reputation :vote, source: :user
  paginates_per 20
  def comments_count
    comments.size
  end
  def curve
    curve = []
    0.upto(7) {|cost| curve << cards_count_by_cost(cost)}
    set_curve_size(curve, curve.max)
  end
  private
    def cards_count_by_cost (cost)
      cards = builder_cards.select {|c| cost >= 7 ? c.card.cost >= cost : c.card.cost == cost}
      cards.sum &:count
    end
    def set_curve_size (curve, max_count)
      max_count = max_count <= 8 ? 12.5 : 100.0/max_count
      curve = curve.map {|count| (count * max_count).round 2}
      curve.join ','
    end
end
