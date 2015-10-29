class VoteService
  def initialize(model)
    @model = model
  end

  def self.most_voted (klass_symbol)
    klass_symbol.to_s.capitalize.constantize.find_with_reputation(:vote, :all).order('vote DESC')
  end

  def set_vote_status(user)
    if @model.has_evaluation? :vote, user
      @evaluation_value = @model.evaluation_by :vote, user
      @model.user_increase_vote = @evaluation_value > 0 ? true : false
      @model.user_decrease_vote = @evaluation_value < 0 ? true : false
    end
  end

  def update_vote(weight, user)
    if @model.has_evaluation? :vote, user
      if @model.evaluation_by(:vote, user) == 0
        @model.increase_evaluation :vote, weight, user
      elsif @model.evaluation_by(:vote, user) > 0
        @model.decrease_evaluation :vote, weight.abs, user
      else
        @model.increase_evaluation :vote, weight.abs, user
      end
    else
      @model.add_evaluation :vote, weight, user
    end
  end
end