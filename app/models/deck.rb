class Deck < ActiveRecord::Base
  include PgSearch
  has_reputation :vote, source: :user
  pg_search_scope :search_by_name, against: :name,
                  using: {tsearch: {prefix: true}}
  attr_accessor :user_increase_vote, :user_decrease_vote
  after_initialize :init

  has_many :builder_cards, dependent: :destroy
  belongs_to :user
  belongs_to :deck_type
  belongs_to :player_class

  def self.most_voted
    find_with_reputation(:vote, :all).order('vote DESC')
  end

  def init
    @user_increase_vote = @user_decrease_vote = false
  end

  def votes
    reputation_for :vote
  end

  def update_vote_status(user)
    @evaluation_value = evaluation_by :vote, user
    @user_increase_vote = true if @evaluation_value > 0
    @user_decrease_vote = true if @evaluation_value < 0
  end

  def update_vote(weight, user)
    if has_evaluation? :vote, user
      if evaluation_by(:vote, user) == 0
        increase_evaluation :vote, weight, user
      elsif evaluation_by(:vote, user) > 0
        decrease_evaluation :vote, weight.abs, user
      else
        increase_evaluation :vote, weight.abs, user
      end
    else
      add_evaluation :vote, weight, user
    end
  end
end
