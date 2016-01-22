class Api::CommentResource < BaseResource
  after_create :send_notification
  attributes :votes, :target_name, :evaluation_value, :body, :commentable_id, :commentable_type, :created_at
  has_one :user

  def self.records(options = {})
    params = options[:context][:params]
    if params[:action] == 'index'
      if params[:user_id].present?
        @comments = _model_class.includes(:commentable, :user).where user_id: params[:user_id]
      else
        @comments = _model_class.includes(:commentable, :user).where commentable_type: params[:commentable_type], commentable_id: params[:commentable_id]
        @comments = params[:page].blank? ? @comments.page(1) : @comments.page(params[:page])
        options[:context][:total_pages] = @comments.total_pages
      end
      @comments

    else
      super options
    end
  end

  def self.updatable_fields(context)
    super - [:votes, :evaluation_value]
  end

  def self.creatable_fields(context)
    super - [:votes, :evaluation_value]
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

  private
    def send_notification
      if @model.commentable.instance_of? Deck
        Notifier.notify @model.commentable.user.id, get_hash('колоде')
      elsif @model.commentable.instance_of? Synergy
        Notifier.notify @model.commentable.user.id, get_hash('синергии')
      end
    end
    def get_hash(name)
      {
          publicNickname: current_user.public_nickname,
          text: 'оставил комментарий к ',
          entity: {
              route: @model.commentable.class.name.downcase,
              id: @model.commentable.id,
              name: name
          }
      }
    end
end
